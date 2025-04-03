//
//  GuideController.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/18.
//

import UIKit
import TangramKit
import Moya
import RxSwift
import NSObject_Rx

class GuideController: BaseLogicController {
    var bannerView: YJBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initLinearLayoutSafeArea()
        container.tg_space = PADDING_OUTER
        
        // 轮播图
        bannerView = YJBannerView()
        bannerView.backgroundColor = .clear
        bannerView.dataSource = self
        bannerView.delegate = self
        bannerView.tg_width.equal(.fill)
        bannerView.tg_height.equal(.fill)
        // 设置如果找不到图片显示的图片
        bannerView.emptyImage = R.image.placeholderError()
        // 设置占位图
        bannerView.placeholderImage = R.image.placeholder()
        // 设置轮播图内部显示图片的时候调用什么方法
        bannerView.bannerViewSelectorString = "sd_setImageWithURL:placeholderImage:"
        // 设置指示器默认颜色
        bannerView.pageControlNormalColor = .black80
        // 高亮的颜色
        bannerView.pageControlHighlightColor = .colorPrimary
        // 重新加载数据
        bannerView.reloadData()
        container.addSubview(bannerView)
        
        // 按钮容器
        let controlContainer = TGLinearLayout(.horz)
        controlContainer.tg_bottom.equal(PADDING_OUTER)
        // controlContainer.tg_width.equal(.fill) 与下面等效
        controlContainer.tg_width ~= .fill
        controlContainer.tg_height.equal(.wrap)
        // 水平拉升，左，中，右间距一样
        controlContainer.tg_gravity = TGGravity.horz.among
        container.addSubview(controlContainer)
        
        // 登录注册按钮
        let primaryButton = ViewFactoryUtil.primaryButton()
        primaryButton.setTitle(R.string.localizable.loginOrRegister(), for: .normal)
        // 这里 self 的意思是它的回调方法在当前这个类里面
        primaryButton.addTarget(self, action: #selector(primaryClick(_:)), for: .touchUpInside)
        primaryButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(primaryButton)
        
        // 立即体验按钮
        let enterButton = ViewFactoryUtil.primaryOutlineButton()
        enterButton.setTitle(R.string.localizable.experienceNow(), for: .normal)
        enterButton.addTarget(self, action: #selector(enterClick(_:)), for: .touchUpInside)
        enterButton.tg_width.equal(BUTTON_WIDTH_MEDDLE)
        controlContainer.addSubview(enterButton)
    }
    
    /// 登录注册按钮点击
    @objc func primaryClick(_ sender: QMUIButton) {
//        AppDelegate.shared.toLogin()
    }
    
    /// 立即体验按钮点击
    @objc func enterClick(_ sender: QMUIButton) {
//        AppDelegate.shared.toMain()
        
        // test
        moyaByDefaultRepository()
    }
    
    func moyaByDefaultRepository() {
        DefaultRepository.shared.sheets(size: 10)
            .subscribeSuccess { result in
                print(result)
                print(result.data.data?[0].title)
            }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwiftOfSubscribeSuccess(){
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheetDetail(data: "1234234234324"))
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<Sheet>.self)
            .subscribeSuccess { result in
                print(result.data!.title!)
            }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwiftOfGeneric1() {
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheetDetail(data: "1"))
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<Sheet>.self)
            .subscribe { event in
            switch event {
            case .next(let result):
                print(result.data!.title!)
            case .error(let error):
                print("error \(error)")
            case .completed:
                print("Completed")
            }
        }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwiftOfGeneric() {
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheets(size: 10))
            .asObservable()
            .mapString()
            .mapObject(ListResponse<Sheet>.self)
            .subscribe { event in
            switch event {
            case .next(let result):
                print(result.data.data?[0].title)
            case .error(let error):
                print("error \(error)")
            case .completed:
                print("Completed")
            }
        }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwiftOfObservable() {
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheets(size: 10))
            .asObservable()
            .mapString()
            .mapObject(SheetListResponse.self)
            .subscribe { event in
            switch event {
            case .next(let result):
                print(result.data.data[0].title!)
            case .error(let error):
                print("error \(error)")
            case .completed:
                print("Completed")
            }
        }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwiftOfJSON() {
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheets(size: 10))
            .subscribe { event in
                switch event {
                case let .success(response):
                    let data = response.data
                    let statusCode = response.statusCode
                    let dataString = String(data: data, encoding: .utf8)!
                    if let result = SheetListResponse.deserialize(from: dataString) {
                        print(result.status)
                        print(result.data.data[0].title!)
                    }
                case let .failure(error):
                    print("request network error \(error)")
                }
            }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByRxSwift() {
        let provider = MoyaProvider<DefaultService>()
        provider.rx.request(.sheets(size: 10))
            .subscribe { event in
                switch event {
                case let .success(response):
                    let data = response.data
                    let statusCode = response.statusCode
                    let dataString = String(data: data, encoding: .utf8)!
                    print("request network success \(statusCode) \(dataString)")
                case let .failure(error):
                    print("request network error \(error)")
                }
            }.disposed(by: rx.disposeBag) // 释放相关的资源
    }
    
    func moyaByOrigin() {
        let provider = MoyaProvider<DefaultService>()
        // result 回调处理，result 是一个枚举类型：请求成功，返回一个 Response 对象；请求失败，返回一个错误对象。
        provider.request(.sheets(size: 10)) { result in
            print(result)
            switch result {
            case let .success(response):
                let data = response.data
                let statusCode = response.statusCode
                let dataString = String(data: data, encoding: .utf8)!
                print("request network success \(statusCode) \(dataString)")
            case let .failure(error):
                print("request network error \(error)")
            }
        }
    }
   

}


extension GuideController:YJBannerViewDataSource {
    /// banner 数据源
    func bannerViewImages(_ bannerView: YJBannerView!) -> [Any]! {
        return ["guide1", "guide2", "guide3", "guide4", "guide5"]
    }
    
    /// 自定义 Cell
    /// 复写该方法的目的是
    /// 设置图片的缩放模式
    func bannerView(_ bannerView: YJBannerView!, customCell: UICollectionViewCell!, index: Int) -> UICollectionViewCell! {
        // 将 cell 类型转为 YJBannerViewCell
        let cell = customCell as! YJBannerViewCell

        // 设置图片的缩放模式为
        // 从中心填充
        // 多余的裁剪掉
        cell.showImageViewContentMode = .scaleAspectFit

        return cell
    }
    
    
}


extension GuideController: YJBannerViewDelegate{
    
}
