//
//  UIImage+Addition.m
//  Note
//
//  Created by xiaolzho on 2019/10/28.
//  Copyright © 2019 xiaolzho. All rights reserved.
//

#import "UIImage+Addition.h"


@implementation UIImage (Addition)

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

+ (UIImage *)maskImage:(UIImage *)img withColor:(UIColor *)maskColor
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, img.size.width*img.scale, img.size.height*img.scale);
    
    UIGraphicsBeginImageContext(imageRect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextTranslateCTM(ctx, 0.0f, -(imageRect.size.height));
    
    CGContextClipToMask(ctx, imageRect, img.CGImage);
    CGContextSetFillColorWithColor(ctx, maskColor.CGColor);
    CGContextFillRect(ctx, imageRect);
    
    UIImage *icon = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *newImage = [UIImage imageWithCGImage:icon.CGImage scale:img.scale orientation:img.imageOrientation];
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
