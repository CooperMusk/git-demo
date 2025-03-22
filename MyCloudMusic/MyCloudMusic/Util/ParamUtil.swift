//
//  ParamUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/21.
//

import Foundation
import Moya

class ParamUtil {
    /// 返回 URL 编码的参数
    static func urlRequestParamters(_ data: [String: Any]) -> Task {
        return .requestParameters(parameters: data, encoding: URLEncoding.default)
    }
    
    /// 返回 JSON 编码的参数
    ///
    /// - Parameter parameters: 要编码的参数
    /// - Returns: 编码后的Task
    static func jsonRequestParamters(_ parameters: [String: Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
}


