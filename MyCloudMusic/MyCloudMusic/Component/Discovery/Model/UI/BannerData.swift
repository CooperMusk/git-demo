//
//  BannerData.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/6.
//

import Foundation

class BannerData {
    
    /// 用来存储网络请求后轮播图的数据
    /// Array<Ad> 即是只能存放 Ad 对象的列表
    var data: Array<Ad>!
    
    init(_ data: Array<Ad>!) {
        self.data = data
    }
    
    
}
