//
//  DiscoveryButtonView.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//

import UIKit
import TangramKit

class DiscoveryButtonView: TGLinearLayout {
    
    init() {
        // 必须要调用 public init 构造方法
        // convenience 申明的构造函数不用必须调用
        super.init(frame: CGRect.zero, orientation: .vert)
        initViews()
    }
    
    // 可视化构造方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    func initViews() {
        // 设置约束
        tg_width.equal(.wrap)
        tg_height.equal(.wrap)
        
        // 控件之间间距
        tg_space = PADDING_MEDDLE
        
        // 内容水平居中
        tg_gravity = TGGravity.horz.center
        
        // 添加其他控件
        let iconContainer = TGRelativeLayout()
        iconContainer.tg_width.equal(50)
        iconContainer.tg_height.equal(50)
        
        addSubview(iconContainer)
        
        iconContainer.addSubview(iconView)
        iconContainer.addSubview(tipView)
        
        addSubview(titleView)
    }
    
    func bind(_ title: String!, _ icon: UIImage!) {
        titleView.text = title
        iconView.image = icon
    }
    
    /// 图标控件
    lazy var iconView: UIImageView = {
        let result = UIImageView()
        result.tg_width.equal(.fill)
        result.tg_height.equal(.fill)
        result.image = R.image.dayRecommend()
        return result
    }()
    
    /// 只有没有推荐按钮，才显示日期，其他按钮没有使用
    lazy var tipView: UILabel = {
        let result = UILabel()
        result.tg_width.equal(.wrap)
        result.tg_height.equal(.wrap)
        result.textColor = .colorLightWhite
        result.font = UIFont.systemFont(ofSize: 13)
        
        result.tg_centerX.equal(0)
        
        // 正数向下偏移
        result.tg_centerY.equal(3)
        
        return result
    }()
    
    /// 标题控件
    lazy var titleView: UILabel = {
        let result = UILabel()
        result.tg_width.equal(.wrap)
        result.tg_height.equal(.wrap)
        result.textColor = .colorOnSurface
        result.font = UIFont.systemFont(ofSize: 13)
        result.text = "6"
        return result
    }()
    
    
}
