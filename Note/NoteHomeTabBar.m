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

- (UIButton *)centerButton{
    if (!_centerButton) {
        _centerButton = [[UIButton alloc]init];
        _centerButton.frame = CGRectMake(SCREEN_WIDTH - CENTER_BUTTON_WIDTH/2, self.bounds.origin.y - CENTER_BUTTON_HEIGHT/2, CENTER_BUTTON_WIDTH, CENTER_BUTTON_HEIGHT);
        [_centerButton setImage:[UIImage imageNamed:@"toolbar_note"] forState:UIControlStateNormal];
        [_centerButton addTarget:self action:@selector(centerButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self bringSubviewToFront:_centerButton];
        [self addSubview:_centerButton]; 
    }
    return _centerButton;
}

#pragma mark - ================= selector ==================

- (void)centerButtonEvent: (id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hi" message:@"You pressed center button just now!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.centerButton.tintColor = [UIColor redColor];
    }];
    
    [alertController addAction:alertAction];
    
    id delegate = [UIApplication sharedApplication].delegate;
    UITabBarController *tabBarController = [delegate tabBarController];
    [tabBarController.selectedViewController presentViewController:alertController animated:NO completion:nil];
    
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

