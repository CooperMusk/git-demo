//
//  SongGroupCell.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/16.
//

import UIKit
import TangramKit
import SwiftEventBus

class SongGroupCell: BaseTableViewCell {
    
    static let NAME = "SongGroupCell"
    var data: SongData!
    
    /// 发现界面每个单曲 cell 高度，51：图片高度，10 * 2 ：上下两个边距
    static let HEIGHT_DISCOVERY_SONG: CGFloat = 51 + 10 * 2
    
    
    override func initViews() {
        super.initViews()
        
        // 分割线
        container.addSubview(ViewFactoryUtil.smallDivider())
        
        // 标题
        container.addSubview(titleView)
        
        container.addSubview(self.tableView)
    }
    
    /// 使 TableViewCell 中的控件都垂直显示
    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }
    
    /// 标题控件
    lazy var titleView: ItemTitleView = {
        let result = ItemTitleView()
        result.titleView.text = R.string.localizable.recommendSong()
        return result
    }()
    
    /// 单曲控件
    lazy var tableView: UITableView = {
        let result = ViewFactoryUtil.tableView()
        
        // 单曲直接添加分割线
        result.separatorStyle = .singleLine
        
        // 分割线颜色
        result.separatorColor = .colorDivider
        
        // 数据源和代理
        result.delegate = self
        result.dataSource = self
        
        // 注册 Cell
        result.register(DiscoverySongCell.self, forCellReuseIdentifier: Constant.CELL)
        
        return result
    }()
    
    func bind(_ data: SongData) {
        self.data = data
        
        // 高度等于，行数 * 行高
        let viewHeight = CGFloat(data.datum.count) * SongGroupCell.HEIGHT_DISCOVERY_SONG
        tableView.tg_height.equal(viewHeight)
        
        tableView.reloadData()
    }
    
    
}


/// 数据源和代理
extension SongGroupCell: QMUITableViewDelegate, QMUITableViewDataSource {
    
    /// 这个方法返回 datum 列表的 count ，如果返回 3 ，就会调用 3 次下面的方法。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.datum.count
    }
    
    /// 返回 Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = data.datum[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CELL, for: indexPath) as! DiscoverySongCell
        
        if indexPath.row == 0 {
            cell.container.tg_padding = UIEdgeInsets(top: 0, left: PADDING_OUTER, bottom: PADDING_MEDDLE, right: PADDING_OUTER)
        } else {
            cell.container.tg_padding = UIEdgeInsets(top: PADDING_MEDDLE, left: PADDING_OUTER, bottom: PADDING_MEDDLE, right: PADDING_OUTER)
        }
        
        cell.bind(data)
        
        return cell
    }
    
    /// 点击了 Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // sender: 当前点击的是哪首音乐
        SwiftEventBus.post(Constant.EVENT_SONG_CLICK, sender: data.datum[indexPath.row])
    }
    
    
}
