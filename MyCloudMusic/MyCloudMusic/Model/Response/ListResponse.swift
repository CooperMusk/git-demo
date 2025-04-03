//
//  ListResponse.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/25.
//

import Foundation
import HandyJSON

class ListResponse<T: HandyJSON>: BaseResponse {
    /// 分页元数据
    var data: Meta<T>!
    
    
}
