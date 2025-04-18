//
//  BaseTableViewCell.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/6.
//

import UIKit

// 提供更高层级布局框架
import TangramKit

class BaseTableViewCell: UITableViewCell {
    
    /// 对于需要动态评估高度的 UITableViewCell 来说可以把布局视图暴露出来。用于高度评估和边界线处理。以及事件处理的设置。
    var container: TGBaseLayout!
    
    /// TableView 动态创建 Cell 的时候，就会调用这个方法。
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        innerInit()
    }
    
    /// 使用可视化编程的时候就会调用这个，使用纯代码调用上面的 init 方法。
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerInit()
    }
    
    func innerInit() {
        initViews()
        initDatum()
        initListeners()
    }
    
    /// 初始化控件
    func initViews() {
        // 背景透明
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        // 禁用单元格的选中高亮效果
        selectionStyle = .none
        
        // 根容器
        container = TGLinearLayout(getContainerOrientation())
        container.tg_width.equal(.fill)
        container.tg_height.equal(.wrap)
        container.tg_space = PADDING_MEDDLE
        contentView.addSubview(container)
    }
    
    /// 设置数据
    func initDatum() {
        
    }
    
    /// 设置监听器
    func initListeners()  {
        
    }
    
    /// 获取根容器布局方向，默认返回水平方向。
    func getContainerOrientation() -> TGOrientation {
        return .horz
    }
    
    /// 使用 TangramKit 后，让 item （也就是cell）自动计算高度，要重写该方法
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return self.container.systemLayoutSizeFitting(targetSize)
    }
    
    
}
