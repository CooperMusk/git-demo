//
//  ExceptionHandleUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/26.
//

import Foundation
// 导入网络框架
import Moya
import Alamofire

class ExceptionHandleUtil {
    
    /// 处理网络响应
    static func handlerResponse(_ data: BaseResponse? = nil, _ error: Error? = nil, _ placeholderView: PlaceholderView? = nil) {
        if error != nil {
            //先处理有异常的请求
            handlerError(error!, placeholderView)
        } else {
            if let r = data?.message {
                // 有错误提示
                TipUtil.show(title: r, placeholderView: placeholderView)
            } else {
                TipUtil.show(title: R.string.localizable.errorUnknown(), placeholderView: placeholderView)
            }
        }
    }
    
    /// 处理错误
    static func handlerError(_ error: Error, _ placeholderView: PlaceholderView? = nil) {
        if let error = error as? MoyaError {
            switch error {
            case .stringMapping(_):
                TipUtil.show(title: "响应转为字符串错误", placeholderView: placeholderView)
            case .statusCode(let response):
                // 响应码
                let code=response.statusCode
                handleHttpError(code, placeholderView)
            case .underlying(_, _):
                // 这里直接判断nsError.code有问题
                // 目前也没找到好的解决方法，暂时用这个方法解决：https://github.com/Moya/Moya/issues/2059
                // NSError 错误 code 对照表：https://www.jianshu.com/p/9c9f14d25572
                if let alamofireError = error.errorUserInfo["NSUnderlyingError"] as? Alamofire.AFError,
                   let underlyingError = alamofireError.underlyingError as? NSError{
                    switch underlyingError.code {
                    case NSURLErrorNotConnectedToInternet:
                        //没有网络连接，例如：关闭了网络
                        TipUtil.show(title: R.string.localizable.networkError(), placeholderView: placeholderView)
                    case NSURLErrorTimedOut:
                        //连接超时，例如：网络特别慢
                        TipUtil.show(title: R.string.localizable.errorNetworkTimeout(), placeholderView: placeholderView)
                    case NSURLErrorCannotFindHost:
                        //域名无法解析，例如：域名写错了
                        TipUtil.show(title: R.string.localizable.errorNetworkUnknownHost(), placeholderView: placeholderView)
                    case NSURLErrorCannotConnectToHost:
                        //无法连接到主机，例如：解析的ip地址，或者直接写的ip地址无法连接
                        TipUtil.show(title: R.string.localizable.errorNetworkUnknownHost(), placeholderView: placeholderView)
                    default:
                        TipUtil.show(title: R.string.localizable.errorUnknown(), placeholderView: placeholderView)
                    }
                }else{
                    TipUtil.show(title: R.string.localizable.errorUnknown(), placeholderView: placeholderView)
                }
                
            default:
                TipUtil.show(title: R.string.localizable.errorUnknown(), placeholderView: placeholderView)
            }
        }
    }
    
    static func handleHttpError(_ data: Int,_ placeholderView: PlaceholderView? = nil) {
        switch data {
        case 401:
            SuperToast.show(title: R.string.localizable.errorNetworkNotAuth())
//            AppDelegate.shared.logout()
        case 403:
            TipUtil.show(title: R.string.localizable.errorNetworkNotPermission(), placeholderView: placeholderView)
        case 404:
            TipUtil.show(title: R.string.localizable.errorNetworkNotFound(), placeholderView: placeholderView)
        case 500..<599:
            TipUtil.show(title: R.string.localizable.errorNetworkServer(), placeholderView: placeholderView)
        default:
            TipUtil.show(title: R.string.localizable.errorUnknown(), placeholderView: placeholderView)
        }
    }
}

