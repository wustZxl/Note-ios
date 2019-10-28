//
//  UIImage+Addition.h
//  Note
//
//  Created by xiaolzho on 2019/10/28.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

+ (UIImage *)maskImage:(UIImage *)img withColor:(UIColor *)maskColor;

@end

