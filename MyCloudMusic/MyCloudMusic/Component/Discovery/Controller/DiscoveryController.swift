//
//  Untitled.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/4.
//
import UIKit
import SwiftEventBus

class DiscoveryController: BaseLogicController {
    
    override func initViews() {
        super.initViews()
        
        // 白天模式和夜间模式
        setBackgroundColor(.colorBackgroundLight)
        
        // 初始化 TableView 结构
        initTableViewSafeArea()
        
        // 注册轮播图 Cell
        tableView.register(BannerCell.self, forCellReuseIdentifier: Constant.CELL)
        
        // 注册 ButtonDataCell
        tableView.register(DiscoveryButtonCell.self, forCellReuseIdentifier: DiscoveryButtonCell.NAME)
        
        // 注册 SheetGroupCell
        tableView.register(SheetGroupCell.self, forCellReuseIdentifier: SheetGroupCell.NAME)
        
        // 注册 SongGroupCell
        tableView.register(SongGroupCell.self, forCellReuseIdentifier: SongGroupCell.NAME)
    }
    
    override func initDatum() {
        super.initDatum()
        
        loadData()
    }
    
    override func initListeners() {
        super.initListeners()
        
        // 监听单曲点击事件
        SwiftEventBus.onMainThread(self, name: Constant.EVENT_SONG_CLICK) {[weak self] data in
            self?.processSongClick(data?.object as! Song)
        }
    }
    
    func loadData() {
        DefaultRepository.shared
            .bannerAds()
            .subscribeSuccess {[weak self] data in
                // 清除原来的数据，因为每次下拉就刷新（向服务器重新请求）
                // 加上 [weak self] 防止内存泄漏
                self?.datum.removeAll()
                
                // 添加轮播图
                self?.datum.append(BannerData(data.data!.data!))
                
                // 添加 ButtonData
                self?.datum.append(ButtonData())
                
                // 请求歌单数据
                self?.loadSheetData()
            }.disposed(by: rx.disposeBag)
    }
    
    /// 请求歌单数据
    func loadSheetData() {
        DefaultRepository.shared
            .sheets(size: VALUE12)
            .subscribeSuccess {[weak self] data in
                // 添加歌单数据
                self?.datum.append(SheetData(data.data!.data!))
                
                // 请求单曲数据
                self?.loadSongData()
            }.disposed(by: rx.disposeBag)
    }
    
    /// 请求单曲
    func loadSongData() {
        DefaultRepository.shared.songs()
            .subscribeSuccess {[weak self] data in
                
                // 添加单曲数据
                self?.datum.append(SongData(data.data!.data!))
                
                // 这个方法会调用 datum.count 那个方法
                self?.tableView.reloadData()
            }.disposed(by: rx.disposeBag)
    }
    
    /// 单曲点击
    func processSongClick(_ data: Song) {
        print("DiscoveryController processSongClick \(data.title!)")
    }
    
    /// 广告点击
    func processAdClick(_ data: Ad) {
        print("DiscoveryController processAdClick \(data.title!)")
    }
    
    /// 获取列表类型
    func typeForItemAtData(_ data: Any) -> MyStyle {
        if data is ButtonData {
            // 轮播图下面的按钮控件
            return .button
        } else if data is SheetData {
            return .sheet
        }else if data is SongData {
            return .song
        }
        return .banner
    }
    
    
}


// MARK: - 列表数据源和代理
extension DiscoveryController {
    
    /// 返回当前位置 Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = datum[indexPath.row]
        
        // 获取当前 Cell 的类型
        let type = typeForItemAtData(data)
        
        switch type {
        case .button:
            // 取出一个 Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoveryButtonCell.NAME, for: indexPath) as! DiscoveryButtonCell
            
            cell.bind(data as! ButtonData)
            
            return cell
        case .sheet:
            // 取出一个 Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: SheetGroupCell.NAME, for: indexPath) as! SheetGroupCell
            
            // 绑定数据（从网络请求的数据与 Cell 进行绑定）
            cell.bind(data as! SheetData)
            
            cell.delegate = self
            
            return cell
        case .song:
            // 单曲 取出一个 Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: SongGroupCell.NAME, for: indexPath) as! SongGroupCell
            
            cell.bind(data as! SongData)
            
            return cell
        default:
            // 取出一个 Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CELL, for: indexPath) as! BannerCell
            
            // 绑定数据（从网络请求的数据与 Cell 进行绑定）
            cell.bind(data as! BannerData)
            
            // 这里的 data 就是 BannerCell 里的 result
            cell.bannerClick = { [weak self] data in
                self?.processAdClick(data)
            }
            
            return cell
        }
    }
    
    
}


// 实现歌单组协议
extension DiscoveryController: SheetGroupDelegate{
    
    func sheetClick(data: Sheet) {
        print("SheetDetailController sheetClick \(data.title!)")
    }
    
    
}

// 总结
// 1.你在哪里创建了 TableView ，你的 数据源和代理 就写在那个文件中。
