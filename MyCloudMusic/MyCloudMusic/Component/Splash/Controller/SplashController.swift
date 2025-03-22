//
//  SplashController.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/3.
//

import UIKit
import TangramKit

class SplashController: BaseLogicController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let container = TGRelativeLayout()
//        // 四边和安全区对齐
//        container.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
//        container.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
//        view.addSubview(container)
        
        // 容器初始化
        self.initRelativeLayoutSafeArea()
        
        // banner
        let bannerView = UIImageView()
        bannerView.tg_width.equal(75)
        bannerView.tg_height.equal(309)
        bannerView.tg_top.equal(120)
        bannerView.tg_centerX.equal(0)
        // bannerView.image = UIImage(named: "SplashBanner")
        bannerView.image = R.image.splashBanner()
        container.addSubview(bannerView)
        
        // 版权
        let copyrightView = UILabel()
        copyrightView.tg_width.equal(.wrap)
        copyrightView.tg_height.equal(.wrap)
        copyrightView.tg_bottom.equal(16)
        copyrightView.tg_centerX.equal(0)
        copyrightView.font = UIFont.systemFont(ofSize: 12)
        copyrightView.textColor = .gray
        let year = SuperDateUtil.currentYear()
        // copyrightView.text = R.string.localizable.clickReload("network bad")
        copyrightView.text = String(format: "Copyright @ %d Musk. All Right Reserved", year)
        container.addSubview(copyrightView)
        
        // logo
        // let logoView = UIImageView(image: UIImage(named: "SplashLogo"))
        let logoView = UIImageView(image: R.image.splashLogo())
        logoView.tg_width.equal(188)
        logoView.tg_height.equal(31)
        logoView.tg_bottom.equal(copyrightView.tg_top).offset(16)
        logoView.tg_centerX.equal(0)
        logoView.contentMode = .scaleAspectFit
        container.addSubview(logoView)
    }
    
    override func initDatum() {
        super.initDatum()
//        if DefaultPreferenceUtil.isAcceptTermsServiceAgreement() {
//            // 已经同意了用户协议
//            prepareNext()
//        } else {
//            showTermsServiceAgreementDialog()
//        }
        // test
        showTermsServiceAgreementDialog()
    }
    
    func prepareNext() {
        next()
    }
    
    func next() {
        AppDelegate.shared.toMain()
    }
    
    /// 显示服务条款对话框
    func showTermsServiceAgreementDialog() {
        dialogController.show()
    }
    
    @objc func primaryClick() {
        dialogController.hide()
        DefaultPreferenceUtil.setAcceptTermsServiceAgreement(true)
        AppDelegate.shared.toGuide()
    }
    
    lazy var dialogController: TermServiceDialogController = {
        let result = TermServiceDialogController()
        result.titleView.text = R.string.localizable.termServicePrivacy()
        result.primaryButton.addTarget(self, action: #selector(primaryClick), for: .touchUpInside)
        return result
    }()


}
