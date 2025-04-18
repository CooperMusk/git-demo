//
//  SheetCell.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//

import UIKit
import TangramKit

class SheetCell: BaseCollectionViewCell {
    
    override func initViews() {
        super.initViews()
        
        container.tg_space = PADDING_SMALL
        container.addSubview(iconView)
        container.addSubview(titleView)
    }
    
    func bind(_ data: Sheet) {
//        if let result = data.icon {
//            let result = ResourceUtil.resourceUri(result)
//            iconView.sd_setImage(with: URL(string: result), placeholderImage: R.image.placeholder())
//        }
        iconView.show(data.icon)
        titleView.text = data.title
    }
    
    lazy var iconView: UIImageView = {
        let result = UIImageView()
        result.tg_width.equal(.fill)
        result.tg_height.equal(result.tg_width)
        result.image = R.image.placeholder()
        
        // 图片从中心等比向外面填充，控件没有黑边，但图片可能被裁剪
        result.contentMode = .scaleAspectFill
        
        // 小圆角
        result.smallCorner()
        
        return result
    }()
    
    /// 标题
    lazy var titleView: UILabel = {
        let result = UILabel()
        result.tg_width.equal(.fill)
        result.tg_height.equal(.wrap)
        result.numberOfLines = 2
        result.font = UIFont.systemFont(ofSize:TEXT_MEDDLE)
        result.textColor = .colorOnSurface
        return result
    }()
    
    
}

