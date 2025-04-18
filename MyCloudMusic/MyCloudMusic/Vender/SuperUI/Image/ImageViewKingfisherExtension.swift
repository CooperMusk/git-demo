//
//  ImageViewKingfisherExtension.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/10.
//

import UIKit

// 图片加载
import Kingfisher


extension UIImageView {
    
    /// 显示头像
    func showAvatar(_ data: String?) {
        show(data, "DefaultAvatar")
    }
    
    /// 显示网络图片
    func show(_ data: String?, _ defaultImage: String = "Placeholder") {
        if SuperStringUtil.isBlank(data) {
            // 空
            // 显示默认图片
            image = UIImage(named: defaultImage)
        } else {
            var newData: String!
            
            // 这里写 http 就包含 https
            if data!.starts(with: "http") {
                newData = data
            } else {
                newData = data?.absoluteUri()
            }
            
            showFull(newData)
        }
    }
    
    /// 显示绝对路径
    func showFull(_ data: String) {
        // 加载的效果
        kf.indicatorType = .activity
        kf.setImage(with: URL(string: data))
    }
    
    /// 显示本地图片
    func showLocal(_ data: String?, _ defaultImage: String = "Placeholder") {
        if (SuperStringUtil.isBlank(data)) {
            // 空
            // 显示默认图片
            self.image = UIImage(named: defaultImage)
        } else {
            kf.indicatorType = .activity
            let url = URL(fileURLWithPath: data!)
            let provider = LocalFileImageDataProvider(fileURL: url)
            kf.setImage(with: provider)
        }
    }
    
    
}
