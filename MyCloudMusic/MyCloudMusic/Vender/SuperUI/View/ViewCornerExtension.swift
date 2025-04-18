//
//  ViewCornerExtension.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//

import UIKit

extension UIView {
    
    /// 设置大圆角
    func largeCorner() {
        corner(SuperConfig.SIZE_LARGE_RADIUS)
    }
     
    /// 显示小的圆角
    /// 这样实现会产生离屏渲染，也就是有性能影响，后面在优化
    func smallCorner() {
        corner(SuperConfig.SIZE_SMALL_RADIUS)
    }
    
    /// 设置圆角
    func corner(_ radius: CGFloat = MEDDLE_RADIUS) {
        // 裁剪多余的内容
        // 例如：给 ImageView 设置了圆角
        // 如果不裁剪多余的内容，就不会生效
        self.clipsToBounds = true
        
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    /// 显示边框
    func border(_ color: UIColor) {
        // 边框为 1
        self.layer.borderWidth = 1
        
        // 边框颜色
        self.layer.borderColor = color.cgColor
    }
    
    
}
