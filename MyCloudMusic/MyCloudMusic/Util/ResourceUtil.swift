//
//  ResourceUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/6.
//

import Foundation

class ResourceUtil {
    
    /// 将相对路径的资源转为绝对路径
    static func resourceUri(_ data:String) -> String {
        return "\(Config.RESOURCE_ENDPOINT)/\(data)"
    }
    
    
}
