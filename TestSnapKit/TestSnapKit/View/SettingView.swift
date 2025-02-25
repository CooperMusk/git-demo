//
//  SettingView.
//  设置 itemView
//  TestSnapKit
//
//  Created by mac on 2025/2/25.
//

import UIKit

class SettingView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        innerInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        innerInit()
    }
    
    func innerInit() {
        backgroundColor = .white
        addSubview(iconView)
        addSubview(titleView)
        addSubview(moreIconView)
    }
    
    /// 当视图加入父类时 / 当视图从父类中移除时调用
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // 添加约束
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleView.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        moreIconView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    /// 左侧图标
    lazy var iconView: UIImageView = {
        let result = UIImageView()
        result.image = UIImage(named: "Setting")
        return result
    }()
    
    /// 标题
    lazy var titleView: UILabel = {
        let result = UILabel()
        result.text = "收藏"
        return result
    }()
    
    /// 右侧图标
    lazy var moreIconView: UIImageView = {
        let result = UIImageView()
        result.image = UIImage(named: "Arrow")
        return result
    }()
}
