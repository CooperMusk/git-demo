//
//  SuperImageExtension.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/9.
//
import UIKit

extension UIImage{
    
    /// 设置图片随着控件默认颜色改变
    func withTintColor() -> UIImage {
        let result = self.withRenderingMode(.alwaysTemplate)
        return result
    }
    
    
}
