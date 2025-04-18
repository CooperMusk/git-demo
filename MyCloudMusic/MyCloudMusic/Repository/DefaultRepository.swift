//
//  DefaultRepository.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/3.
//

import Foundation

//导入响应式编程框架
import RxSwift

//导入JSON解析框架
import HandyJSON

//导入网络框架
import Moya


class DefaultRepository {
    static let shared = DefaultRepository()
    
    private var provider: MoyaProvider<DefaultService>!
    
    /// 私有构造方法
    private init() {
        // 插件列表
        var plugins: [PluginType] = []
        
        // 表示当前是调试模式才打印日志
        if Config.DEBUG {
            // 添加网络请求日志插件
            plugins.append(NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)))
        }
        
        // 网络请求加载对话框
        let networkActivityPlugin = NetworkActivityPlugin { change, target in
            // changeType类型是NetworkActivityChangeType
            // 通过它能监听到开始请求和结束请求
            // targetType 类型是 TargetType
            // 就是我们这里的 service
            // 通过它能判断是那个请求
            if change == .began {
                // 开始请求
                let targetType = target as! DefaultService
                switch targetType {
                // 在这里添加你需要延迟动画的请求
                case .sheets, .register:
                    DispatchQueue.main.async {
                        // 切换到主线程
                        SuperToast.showLoading()
                    }
                default:
                    break
                }
            } else {
                // 结束请求
                DispatchQueue.main.async {
                    SuperToast.hideLoading()
                }
            }
        }
        
        // 添加插件
        plugins.append(networkActivityPlugin)
        
        provider = MoyaProvider<DefaultService>(plugins: plugins)
    }
    
    /// 歌单列表
    func sheets(size: Int) -> Observable<ListResponse<Sheet>> {
        return provider
                .rx
                .request(.sheets(size: size))
                .asObservable()
                .mapString()
                .mapObject(ListResponse<Sheet>.self)
    }
    
    /// 歌单详情
    func sheetDetail(_ data: String) -> Observable<DetailResponse<Sheet>> {
        return provider
                .rx
                .request(.sheetDetail(data: data))
                .asObservable()
                .mapString()
                .mapObject(DetailResponse<Sheet>.self)
    }
    
    /// 音乐列表
    func songs() -> Observable<ListResponse<Song>> {
        return provider
                .rx
                .request(.songs)
                .asObservable()
                .mapString()
                .mapObject(ListResponse<Song>.self)
    }
    
    /// 音乐详情
    func songDetail(_ data: String) -> Observable<DetailResponse<Song>> {
        return provider
                .rx
                .request(.songDetail(data: data))
                .asObservable()
                .mapString()
                .mapObject(DetailResponse<Song>.self)
    }
    
    /// 轮播图广告
    func bannerAds() -> Observable<ListResponse<Ad>> {
        return provider
                .rx
                .request(.ads(position: VALUE0))
                .asObservable()
                .mapString()
                .mapObject(ListResponse<Ad>.self)
    }
    
    
}
