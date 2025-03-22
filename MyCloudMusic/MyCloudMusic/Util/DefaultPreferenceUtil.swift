//
//  DefaultPreferenceUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/19.
//

import Foundation

class DefaultPreferenceUtil {
    static let TERMS_SERVICE = "TERMS_SERVICE"
    
    /// 是否同意了用户条款
    static func isAcceptTermsServiceAgreement() -> Bool {
        return UserDefaults.standard.bool(forKey: TERMS_SERVICE)
    }
    
    /// 设置同意了用户协议
    static func setAcceptTermsServiceAgreement(_ data: Bool) {
        UserDefaults.standard.set(data, forKey: TERMS_SERVICE)
    }
    
    
}
