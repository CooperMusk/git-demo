//
//  PageResponse.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/24.
//

import Foundation
import HandyJSON

class PageResponse: HandyJSON {
    var total: Int = 0
    
    var pages: Int = 0
    
    var data: [Sheet]!
    
    required init() {}
    
    
}
