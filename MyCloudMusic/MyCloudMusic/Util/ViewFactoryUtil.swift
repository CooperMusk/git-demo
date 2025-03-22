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
}
