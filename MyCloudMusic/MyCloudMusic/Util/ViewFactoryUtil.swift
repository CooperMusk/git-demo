//
//  ViewFactoryUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/7.
//

import UIKit
import TangramKit

class ViewFactoryUtil {
    static func primaryButton() -> QMUIButton {
        let result = QMUIButton()
        // 点击按钮的时候文本不变色
        result.adjustsTitleTintColorAutomatically = false
        // 点击按钮时候高亮颜色自动调整
        result.adjustsButtonWhenHighlighted = true
        result.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_LARGE)
        result.tg_width.equal(.fill)
        result.tg_height.equal(BUTTON_MEDDLE)
        result.backgroundColor = .colorPrimary
        result.layer.cornerRadius = SMALL_RADIUS
        result.tintColor = .colorLightWhite
        result.setTitleColor(.colorLightWhite, for: .normal)
        return result
    }
    
    static func primaryHalfFilletButton() -> QMUIButton {
        let result = primaryButton()
        result.layer.cornerRadius = BUTTON_MEDDLE_RADIUS
        return result
    }
    
    static func linkButton() -> QMUIButton {
        let result = QMUIButton()
        // 点击按钮的时候文本不变色
        result.adjustsTitleTintColorAutomatically = false
        result.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        return result
    }
    
    static func primaryOutlineButton() -> QMUIButton {
        let result = primaryButton()
        result.layer.cornerRadius = SMALL_RADIUS
        result.tintColor = .black130
        result.layer.borderWidth = 1
        result.layer.borderColor = UIColor.black130.cgColor
        result.backgroundColor = .clear
        result.setTitleColor(.colorPrimary, for: .normal)
        return result
    }
    
    /// 创建 TableView
    static func tableView() -> UITableView {
        let result = QMUITableView()
        result.backgroundColor = .clear
        
        // 去掉没有数据 cell 的分割线
        result.tableFooterView = UIView()
        
        // 去掉默认分割线
        result.separatorStyle = .none
        
        // 修复默认分割线，向右偏移问题
        result.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        result.tg_width.equal(.fill)
        result.tg_height.equal(.fill)
        
        // 设置所有 cell 的高度为高度自适应，如果 cell 高度是动态的请这么设置。
        // 如果不同的 cell 有差异那么可以通过实现协议方法-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
        // 如果您最低要支持到iOS7那么请您实现-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath方法来代替这个属性的设置。
        result.rowHeight = UITableView.automaticDimension
        
        result.estimatedRowHeight = UITableView.automaticDimension
        
        // 不显示滚动条
        result.showsVerticalScrollIndicator = false
        
        result.allowsSelection = true
        
        // 分割线颜色
        result.separatorColor = .colorDivider
        
        return result
    }
    
    
}
