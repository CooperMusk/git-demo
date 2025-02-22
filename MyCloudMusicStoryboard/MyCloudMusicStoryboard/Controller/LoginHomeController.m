//
//  LoginHomeController.m
//  MyCloudMusicStoryboard
//
//  Created by mac on 2025/2/21.
//

#import "LoginHomeController.h"

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
