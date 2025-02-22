//
//  SceneDelegate.h
//  MyCloudMusicStoryboard
//
//  Created by mac on 2025/2/21.
//

#import <UIKit/UIKit.h>

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;

/// 获取单例对象
+(instancetype)shared;

/// 启动登陆主界面
-(void)toLoginHome;

@end

