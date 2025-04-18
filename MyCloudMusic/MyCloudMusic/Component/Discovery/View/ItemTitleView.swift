//
//  ItemTitleView.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//

import UIKit
import TangramKit

class ItemTitleView: TGRelativeLayout {
    
    init() {
        super.init(frame: CGRect.zero)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initViews()
    }
    
    func initViews() {
        tg_width.equal(.fill)
        tg_height.equal(.wrap)
        tg_padding = UIEdgeInsets(top: PADDING_MEDDLE, left: PADDING_OUTER, bottom: PADDING_MEDDLE, right: PADDING_OUTER)
        addSubview(titleView)
        addSubview(moreIconView)
    }
    
    lazy var titleView: UILabel = {
        let result = UILabel()
        result.tg_width.equal(.wrap)
        result.tg_height.equal(.wrap)
        
        // 在垂直方向上居中
        result.tg_centerY.equal(0)
        
        // 内容只能显示一行
        result.numberOfLines = 1
        
        result.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE2)
        result.textColor = .colorOnSurface
        return result
    }()
    
    lazy var moreIconView: UIImageView = {
        let result = UIImageView()
        result.tg_width.equal(15)
        result.tg_height.equal(15)
        result.image = R.image.superChevronRight()?.withTintColor()
        
        // 指定控件的颜色，可以改变以上图片的颜色
        result.tintColor = .black80
        
        // 在垂直方向上居中
        result.tg_centerY.equal(0)
        
        // 靠右侧
        result.tg_right.equal(0)
        
        // 图片完全显示到控件里面
        result.contentMode = .scaleAspectFit
        
        return result
    }()
    
    
}
