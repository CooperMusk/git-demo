//
//  SceneDelegate.m
//  MyCloudMusicStoryboard
//
//  Created by mac on 2025/2/21.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

+ (instancetype)shared{
    // connectedScenes 类型是 NSSet，保存的元素不重复，无序，不是 NSArray
    // allObjects 方法是转位数组，然后取值
    UIScene *scene = [UIApplication.sharedApplication.connectedScenes allObjects][0];
    return scene.delegate;
}

- (void)toLoginHome{
    [self setRootViewController:@"LoginHomeNav"];
}

/// 设置根控制器
- (void)setRootViewController:(NSString *)data{
    // 获取 Main.storyboard
    UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:@"Main" bundle:nil];
    // 实例化场景
    // 因为场景关联控制器
    // 也可以说实例化一个控制器
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:data];
    // 替换掉原来的根控制器
    // 目的是不喜欢用户可以返回到原来的界面
    self.window.rootViewController = target;
}


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
