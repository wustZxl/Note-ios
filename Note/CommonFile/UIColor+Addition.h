//
//  UIColor+Addition.h
//  Note
//
//  Created by xiaolzho on 2019/10/25.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
//将颜色转换成RGB
+ (NSArray *)convertColorToRGB:(UIColor *)color;
//设置十六进制颜色
+ (UIColor *)colorWithHex:(NSInteger)hex;
+ (UIColor*)colorWithHexString:(NSString *)hexString;

@end

