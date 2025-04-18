//
//  SuperStringUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/10.
//

import Foundation
import SwifterSwift


class SuperStringUtil {
    
    /// 是否不为空
    static func isNotBlank(_ data: String?) -> Bool {
        return !isBlank(data)
    }
    
    /// 是否为空
    static func isBlank(_ data: String?) -> Bool {
        var data = data
        data = data?.trimmed
        return data == nil || data!.isEmpty
    }
    
    
}
