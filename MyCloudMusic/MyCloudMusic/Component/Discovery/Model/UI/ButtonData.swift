//
//  ButtonData.swift
//  MyCloudMusic
//
//  Created by mac on 2025/4/7.
//

import Foundation

class ButtonData {
    
    var title: String!
    var icon: UIImage!
    
    
    init(_ title: String!, _ icon: UIImage!) {
        self.title = title
        self.icon = icon
    }
    
    init() {
        
    }
    
    lazy var datum: [ButtonData] = {
        var result: [ButtonData] = []
        result.append(ButtonData(R.string.localizable.dayRecommend(), R.image.dayRecommend()))
        result.append(ButtonData(R.string.localizable.personFm(), R.image.personFm()))
        result.append(ButtonData(R.string.localizable.sheet(), R.image.sheet()))
        result.append(ButtonData(R.string.localizable.rank(), R.image.rank()))
        result.append(ButtonData(R.string.localizable.live(), R.image.buttonLive()))
        result.append(ButtonData(R.string.localizable.digitalAlbum(), R.image.digitalAlbum()))
        result.append(ButtonData(R.string.localizable.digitalAlbum(), R.image.digitalAlbum()))
        return result
    }()
    
    
}
