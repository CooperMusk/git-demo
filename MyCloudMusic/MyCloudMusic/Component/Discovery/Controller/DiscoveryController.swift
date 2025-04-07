//
//  Untitled.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/4.
//
import UIKit

class DiscoveryController: BaseLogicController {
    
    override func initViews() {
        super.initViews()
        
        // 初始化 TableView 结构
        initTableViewSafeArea()
        
        // 注册轮播图 Cell
        tableView.register(BannerCell.self, forCellReuseIdentifier: Constant.CELL)
    }
    
    override func initDatum() {
        super.initDatum()
        
        loadData()
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
                
                // 这个方法会调用 datum.count 那个方法
                self?.tableView.reloadData()
            }.disposed(by: rx.disposeBag)
    }
    
    /// 广告点击
    func processAdClick(_ data: Ad) {
        print("DiscoveryController processAdClick \(data.title!)")
    }
    
    
}


// MARK: - 列表数据源和代理
extension DiscoveryController {
    
    /// 返回当前位置 Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = datum[indexPath.row] as! BannerData
        
        // 取出一个 Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CELL, for: indexPath) as! BannerCell
        
        // 绑定数据（从网络请求的数据与 Cell 进行绑定）
        cell.bind(data)
        
        cell.bannerClick = { [weak self] data in
            self?.processAdClick(data)
        }
        
        return cell
    }
    
    
}
