//
//  BaseCommon.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/24.
//

import Foundation

// 导入JSON解析框架
import HandyJSON

class BaseCommon: BaseId {
    /// 创建时间
    var createdAt: String!
    
    /// 更新时间
    var updatedAt: String!
    
    /// 映射字段名称不一样的情况，such as JSON 数据是 created_at 而这里是 createdAt
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        mapper <<< self.createdAt <-- "created_at"
        mapper <<< self.updatedAt <-- "updated_at"
    }
    
    
}
