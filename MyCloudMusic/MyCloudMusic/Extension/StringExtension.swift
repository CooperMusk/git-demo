//
//  StringExtension.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/10.
//

import Foundation


extension String {
    
    // 将相对资源转为绝对路径
    func absoluteUri() -> String {
        return "\(Config.RESOURCE_ENDPOINT)\(self)"
    }
    
    
}
