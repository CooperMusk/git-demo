//
//  SheetList.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/22.
//

import Foundation
import HandyJSON

class SheetListResponse: HandyJSON{
    var status: Int = 0
    
    var data: PageResponse!
    
    /// 实现 HandyJSON 这个协议必须写这个方法，否则会报错
    required init() {}
    
    
}
