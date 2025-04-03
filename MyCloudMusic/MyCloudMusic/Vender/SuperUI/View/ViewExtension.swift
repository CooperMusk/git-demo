//
//  ViewExtension.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/26.
//

import Foundation
import TangramKit

extension UIView {
    /// 隐藏
    func hide() {
        tg_visibility = .gone
    }
    
    /// 显示
    func show(_ data:Bool=true) {
        tg_visibility = data ? .visible : .gone
    }
}
