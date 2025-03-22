//
//  DefaultService.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/21.
//

import Foundation
import Moya

enum DefaultService {
    // 广告列表
    case ads(position: Int)
    
    // 歌单列表
    case sheets(size: Int)
    
    // 注册
    case register(data: User)
    
    
}


// MARK: - 实现 TargetType 协议（Moya 框架中）
extension DefaultService: TargetType {
    ///  返回所有请求公共地址部分
    var baseURL: URL {
        return URL(string: Config.ENDPOINT)!
    }
    
    /// 返回每个请求公共地址后面的部分
    var path: String {
        switch self {
        case .ads(_):
            return "v1/ads"
            
        case .sheets:
            return "v1/sheets"
            
        case .register(_):
            return "v1/users"
            
        default:
            fatalError("DefaultService path is null")
        }
    }
    
    /// 返回请求的方式
    var method: Moya.Method {
        switch self {
        case .register:
            return .post
            
        default:
            return .get
        }
    }
    
    /// 请求的参数
    var task: Moya.Task {
        switch self {
        case .ads(let position):
            // 这里的 position 必须和服务端一致
            return ParamUtil.urlRequestParamters(["position": position])
        
        case .sheets(let size):
            return ParamUtil.urlRequestParamters(["size": size])
            
        // 不传递任何参数
        default:
            return .requestPlain
        }
    }
    
    /// 请求头
    var headers: [String : String]? {
        var headers: Dictionary<String, String> = [:]
        return headers
    }
    
    
}
    
