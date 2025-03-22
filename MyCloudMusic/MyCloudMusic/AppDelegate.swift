//
//  AppDelegate.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// 返回的是 AppDelegate 这个类的实例
    open class var shared: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 设置默认显示的界面
        let controller = SplashController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        return true
    }
    
    func setRootViewController(_ data: UIViewController) {
        window!.rootViewController = data
    }
    
    /// 跳转到引导界面
    func toGuide() {
        let result = GuideController()
        setRootViewController(result)
    }
    
    /// 跳转到首页
    func toMain() {
//        let result = MainController()
        let result = UINavigationController(rootViewController: MainController())
        setRootViewController(result)
    }
    
    /// 跳转到登录首页
    func toLogin() {
        toMain()
        
        // 等主界面显示完成之后，再去发送一个跳转到登录界面的通知，在发现界面处理
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(Constant.EVENT_LOGIN_CLICK), object: nil)
        }
    }
    

}
