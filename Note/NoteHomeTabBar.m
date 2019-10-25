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
        _centerButton.frame = CGRectMake((SCREEN_WIDTH - CENTER_BUTTON_WIDTH)/2.0, self.bounds.origin.y - CENTER_BUTTON_HEIGHT/2.0, CENTER_BUTTON_WIDTH, CENTER_BUTTON_HEIGHT);
        [_centerButton setImage:[UIImage imageNamed:@"tabbar_home"] forState:UIControlStateNormal];
        [_centerButton addTarget:self action:@selector(centerButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self bringSubviewToFront:_centerButton];
        _centerButton.accessibilityLabel = @"Home"; // Accessibility inspector
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

// 重写hitTest方法，让超出tabBar部分也能响应事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    UIView *result = [super hitTest:point withEvent:event];
    // 如果事件发生在tabbar里面直接返回
    if (result) {
        return result;
    }
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为subview的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在subView里就返回
        if (result) {
            return result;
        }
    }
    return nil;
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

