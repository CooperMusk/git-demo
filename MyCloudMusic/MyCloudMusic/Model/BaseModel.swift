//
//  BaseModel.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/24.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    required init() {}
    
    // 服务端返回的 JSON 与我们用到的不一样
    func mapping(mapper: HelpingMapper) {
        
    }
    
    
}
