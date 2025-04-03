//
//  DetailResponse.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/25.
//

import Foundation
import HandyJSON

class DetailResponse<T: HandyJSON>: BaseResponse {
    var data: T?
    
    init(_ data: T) {
        self.data = data
    }
    
    /// 因为我们重写了 init，所以必须重写 required init
    required init() {
        super.init()
    }
    
    
}
