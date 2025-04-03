//
//  TipUtil.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/26.
//

import Foundation

class TipUtil {
    static func show(title:String,placeholderView:PlaceholderView?=nil) {
        if let r = placeholderView {
            r.show()
            
            r.show(title: R.string.localizable.clickReload(title))
        }else{
            SuperToast.show(title: title)
        }
    }
}
