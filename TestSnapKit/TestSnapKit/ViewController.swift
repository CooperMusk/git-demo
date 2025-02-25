//
//  ViewController.swift
//  TestSnapKit
//
//  Created by mac on 2025/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("222222222")
        view.backgroundColor = .white
        // MARK: - 控件
        // 添加一个根容器
        self.container = UIView()
        //        container.backgroundColor = .red
        view.addSubview(container)
        // container.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        // logo
        let logoView = UIImageView()
        logoView.image = UIImage(named: "Logo")
        container.addSubview(logoView)
        // 手机号登录按钮
        container.addSubview(phoneLoginButton)
        // 用户名密码登录按钮
        container.addSubview(primaryButton)
        // 用户协议
        let agreementLabelView = UILabel()
        agreementLabelView.text = "登录即表示您同意《用户协议》和《隐私政策》"
        agreementLabelView.font = UIFont.systemFont(ofSize: 12)
        agreementLabelView.textColor = .gray
        container.addSubview(agreementLabelView)
        
        // MARK: - 约束
        // 根容器
        container.snp.makeConstraints { make in
            // 正数表示向下
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            // 负数表示向下
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        // Logo
        logoView.snp.makeConstraints { make in
            // 宽高
            make.width.equalTo(100)
            make.height.equalTo(100)
            // 距离顶部
            make.top.equalTo(100)
            // 水平居中
            make.centerX.equalToSuperview()
        }
        // 用户协议
        agreementLabelView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        // 用户名和密码登录按钮
        primaryButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(42)
            make.bottom.equalTo(agreementLabelView.snp.top).offset(-30)
        }
        // 手机号登录按钮
        phoneLoginButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(42)
            make.bottom.equalTo(primaryButton.snp.top).offset(-30)
        }
        
    }
    
    @objc func phoneLoginClick(_ sender: UIButton) {
        print("ViewController phoneLoginClick \(sender.titleLabel?.text)")
        let target = SettingController()
        navigationController!.pushViewController(target, animated: true)
    }
    
    @objc func primaryClick(_ sender: UIButton) {
        print("ViewController primaryClick \(sender.titleLabel?.text)")
    }
    
    /// 手机号登录按钮，懒加载
    lazy var phoneLoginButton: UIButton = {
        let result = UIButton(type: .system)
        // 设置标题
        result.setTitle("手机号登录", for: .normal)
        // 设置点击事件
        // 写 self 表示回调方法是在当前类中
        result.addTarget(self, action: #selector(phoneLoginClick(_:)), for: .touchUpInside)
        result.backgroundColor = .red
        result.layer.cornerRadius = 5
        // 标题默认颜色
        result.setTitleColor(.white, for: .normal)
        // 按下按钮时候的颜色
        result.setTitleColor(.gray, for: .highlighted)
        return result
    }()
    
    /// 用户名和密码登录按钮
    lazy var primaryButton: UIButton = {
        let result = UIButton(type: .system)
        // 设置标题
        result.setTitle("用户名和密码登录", for: .normal)
        // 设置点击事件
        // 写 self 表示回调方法是在当前类中
        result.addTarget(self, action: #selector(primaryClick(_:)), for: .touchUpInside)
        result.backgroundColor = .clear
        result.layer.cornerRadius = 21
        result.layer.borderWidth = 1
        result.layer.borderColor = UIColor.red.cgColor
        // 标题默认颜色
        result.setTitleColor(.red, for: .normal)
        // 按下按钮时候的颜色
        result.setTitleColor(.gray, for: .highlighted)
        print("11111111111")
        return result
    }()
    
    
}

