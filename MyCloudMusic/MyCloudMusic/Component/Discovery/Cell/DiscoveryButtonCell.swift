//
//  DiscoveryButtonCell.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/7.
//

import UIKit
import TangramKit

class DiscoveryButtonCell: BaseTableViewCell {
    
    static let NAME = "DiscoveryButtonCell"
    
    override func initViews() {
        super.initViews()
        
        container.addSubview(scrollView)
    }
    
    lazy var scrollView: UIScrollView = {
        let result = UIScrollView()
        result.contentInset = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
        result.showsHorizontalScrollIndicator = false
        result.tg_width.equal(.fill)
        result.tg_height.equal(100)
        
        // 真实内容容器
        result.addSubview(self.contentContainer)
        
        return result
    }()
    
    lazy var contentContainer: TGBaseLayout = {
        let result = TGLinearLayout(.horz)
        result.tg_width.equal(.wrap)
        result.tg_height.equal(100)
        
        // 在垂直方向上居中对齐
        result.tg_gravity = TGGravity.vert.center
        
        return result
    }()
    
    func bind(_ data: ButtonData) {
        if contentContainer.subviews.count > 0 {
            return
        }
        
        // 每个按钮控件的宽度
        let containerWidth = (UIScreen.main.bounds.width - 10 * 2) / 5.5
        
        for it in data.datum {
            // 每个按钮控件
            let buttonView = DiscoveryButtonView()
            
            buttonView.tg_width.equal(containerWidth)
            buttonView.bind(it.title, it.icon)
            
            // 只有在每日推荐这个标题下才显示日期
            if it.title == R.string.localizable.dayRecommend() {
                // 显示日期
                buttonView.tipView.text = "\(SuperDateUtil.currentDay())"
            }
            
            // 设置点击事件
            contentContainer.addSubview(buttonView)
        }
    }
    
    
}
