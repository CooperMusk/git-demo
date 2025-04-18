//
//  SheetGroupCell.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//

import UIKit
import TangramKit


/// 协议
protocol SheetGroupDelegate: NSObjectProtocol {
    
    /// 歌单点击回调
    /// - Parameter data: 点击的歌单对象
    func sheetClick(data: Sheet)
    
    
}


class SheetGroupCell: BaseTableViewCell {
    
    static let NAME = "SheetGroupCell"
    var datum: Array<Sheet> = []
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!
    
    /// 每行显示三列
    var spanCount: CGFloat = 3
    
    weak open var delegate: SheetGroupDelegate?
    
    
    override func initViews() {
        super.initViews()
        
        // 分割线
        container.addSubview(ViewFactoryUtil.smallDivider())
        
        // 标题
        container.addSubview(titleView)
        
        // 歌单（一行三列）
        container.addSubview(collectionView)
        
        // 注册歌单 Cell
        collectionView.register(SheetCell.self, forCellWithReuseIdentifier: Constant.CELL)
    }
    
    /// 使 TableViewCell 中的控件都垂直显示
    override func getContainerOrientation() -> TGOrientation {
        return .vert
    }
    
    /// 标题控件
    lazy var titleView: ItemTitleView = {
        let result = ItemTitleView()
        result.titleView.text = R.string.localizable.recommendSheet()
        return result
    }()
    
    /// 歌单控件
    lazy var collectionView: UICollectionView = {
        let result = ViewFactoryUtil.collectionView()
        
        // 数据源和代理
        result.delegate = self
        result.dataSource = self
        
        result.isScrollEnabled = false
        return result
    }()
    
    func bind(_ data: SheetData) {
        // 计算每个 Cell 宽度
        // 屏幕宽度-外边距 16 * 2 - (self.spanCount - 1) * 5
        cellWidth = (SCREEN_WIDTH - PADDING_OUTER * CGFloat(2) - (spanCount - CGFloat(1)) * PADDING_SMALL) / spanCount
        
        // Cell 高度，5:图片和标题边距，40：2 行文字高度
        cellHeight = cellWidth + PADDING_SMALL + 40
        
        // 计算可以显示几行
        let rows = ceil(CGFloat(data.datum.count) / spanCount)
        
        // CollectionView 高度等于，行数 * 行高，10：垂直方向每个cell间距
        let viewHeight = rows * (cellHeight + PADDING_MEDDLE)
        
        collectionView.tg_height.equal(viewHeight)
        datum.removeAll()
//        datum += data.datum // TODO 不知道这里作者为啥用 +=
        datum = data.datum
        collectionView.reloadData()
    }
    
    
}


/// CollectionView 数据源和代理
extension SheetGroupCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    /// 这个方法返回 datum 列表的 count ，如果返回 3 ，就会调用 3 次下面的方法。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datum.count
    }
    
    /// 返回 Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = datum[indexPath.row]
        
        // 取出一个 Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CELL, for: indexPath) as! SheetCell
        
        // 绑定数据（从网络请求的数据与 Cell 进行绑定）
        cell.bind(data)
        
        return cell
    }
    
    /// item 点击
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let d = delegate {
            d.sheetClick(data: datum[indexPath.row])
        }
    }
    
    
}


/// CollectionView 的间距
extension SheetGroupCell: UICollectionViewDelegateFlowLayout {
    
    /// 返回 CollectionView 里面的 Cell 到 CollectionView 的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
    }
    
    /// 返回每个 Cell 的行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return PADDING_MEDDLE
    }
    
    /// 返回每个 Cell 的列间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return PADDING_SMALL
    }
    
    /// Cell 尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}
