//
//  PlaceholderView.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/26.
//

import Foundation
import TangramKit

class PlaceholderView: BaseRelativeLayout {
    override func initViews() {
        super.initViews()
        
        //设置约束
        tg_width.equal(.fill)
        tg_height.equal(.fill)
        
        //内边距
        tg_padding = UIEdgeInsets(top: PADDING_OUTER, left: PADDING_OUTER, bottom: PADDING_OUTER, right: PADDING_OUTER)
        
        //创建一个垂直方向容器
        let contaienr=TGLinearLayout(.vert)
        contaienr.tg_width.equal(.wrap)
        contaienr.tg_height.equal(.wrap)
        
        //控件之间间距
        contaienr.tg_space = PADDING_OUTER
        
        //内容水平居中
        contaienr.tg_gravity = TGGravity.horz.center
        
        //居中
        contaienr.tg_centerX.equal(0)
        contaienr.tg_centerY.equal(0)
        addSubview(contaienr)
        
        //添加其他控件
        contaienr.addSubview(iconView)
        contaienr.addSubview(titleView)
    }
    
    func show(title:String,icon:UIImage = R.image.alert()!) {
        iconView.image = icon
        titleView.text = title
    }
    
    lazy var iconView: UIImageView = {
        let r = UIImageView()
        r.tg_width.equal(150)
        r.tg_height.equal(150)
        r.image = R.image.alert()
        return r
    }()
    
    lazy var titleView: UILabel = {
        let r = UILabel()
        r.tg_width.equal(.wrap)
        r.tg_height.equal(.wrap)
        r.numberOfLines = 0
        r.text = R.string.localizable.errorNetworkConnect()
        r.textColor = .black80
        r.font = UIFont.systemFont(ofSize: TEXT_SMALL)
        return r
    }()
}
