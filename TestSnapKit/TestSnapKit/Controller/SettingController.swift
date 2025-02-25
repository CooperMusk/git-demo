//
//  SettingController.swift
//  TestSnapKit
//
//  Created by mac on 2025/2/25.
//

import UIKit

class SettingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "设置界面"
        view.addSubview(settingView)
        view.addSubview(colletView)
        // 添加约束
        settingView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.height.equalTo(55)
        }
        colletView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(settingView.snp.bottom).offset(1)
            make.height.equalTo(55)
        }
    }
    
    @objc func onSettingClick(recognizer: UITapGestureRecognizer) {
        print("onSettingClick")
    }
    
    /// 设置 Item
    lazy var settingView: SettingView = {
        let result = SettingView()
        // 设置点击事件
        result.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onSettingClick(recognizer:))))
        return result
    }()
    
    /// 收藏 Item
    lazy var colletView: SettingView = {
        let result = SettingView()
        result.titleView.text = "收藏"
        result.iconView.image = UIImage(named: "Setting")
        return result
    }()

}
