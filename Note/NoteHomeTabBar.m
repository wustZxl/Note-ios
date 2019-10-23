//
//  NoteHomeTabBar.m
//  Note
//
//  Created by xiaolzho on 2019/10/21.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import "NoteHomeTabBar.h"
#import "UICommon.h"

@interface NoteHomeTabBar ()

@end

@implementation NoteHomeTabBar

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.centerButton];
    }
    return self;
}

- (UIButton *)centerButton{
    if (!_centerButton) {
        _centerButton = [[UIButton alloc]init];
        _centerButton.frame = CGRectMake((SCREEN_WIDTH - CENTER_BUTTON_WIDTH)/2, self.bounds.origin.y - CENTER_BUTTON_HEIGHT/2, CENTER_BUTTON_WIDTH, CENTER_BUTTON_HEIGHT);
        [_centerButton setImage:[UIImage imageNamed:@"tabbar_home"] forState:UIControlStateNormal];
        [_centerButton addTarget:self action:@selector(centerButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self bringSubviewToFront:_centerButton];
         
    }
    return _centerButton;
}

#pragma mark - ================= selector ==================

- (void)centerButtonEvent: (id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hi" message:@"You pressed center button just now!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:alertAction];
    
    id delegate = [UIApplication sharedApplication].delegate;
    UITabBarController *vc = [delegate tabBarController];
    
    [vc.selectedViewController presentViewController:alertController animated:YES completion:nil];
    
    NSLog(@"click center button...");
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

