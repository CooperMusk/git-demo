//
//  LoginHomeController.m
//  MyCloudMusicStoryboard
//
//  Created by mac on 2025/2/21.
//

#import "LoginHomeController.h"
#import "LoginController.h"

@interface LoginHomeController ()

/// 主按钮
@property (weak, nonatomic) IBOutlet UIButton *primaryButton;

@end

@implementation LoginHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 圆角
    self.primaryButton.layer.cornerRadius = 21;
    // 边框
    self.primaryButton.layer.borderColor = [UIColor colorNamed:@"Primary"].CGColor;
    self.primaryButton.layer.borderWidth = 1;
}

/// 主按钮点击
- (IBAction)primaryClick:(UIButton *)sender {
    NSLog(@"LoginHomeController primaryClick");
    // 获取 Main.storyboard
    UIStoryboard *storyboard = [UIStoryboard  storyboardWithName:@"Main" bundle:nil];
    // 实例化一个控制器
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
    [self.navigationController pushViewController:target animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
