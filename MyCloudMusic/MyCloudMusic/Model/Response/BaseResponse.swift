//
//  BaseResponse.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/25.
//

import Foundation

class BaseResponse: BaseModel {
    /// 状态码
    var status: Int = 0
    
    /// 错误信息，发生错误请求的时候才会出现
    var message: String?
    
    
}
