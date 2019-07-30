//
//  UIImage+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    XTImageVerticalTop = 0,
    XTImageVerticalCenter,
    XTImageVerticalBottom
}XTImageVertical;


typedef enum {
    XTImageHorizontalLeft = 0,
    XTImageHorizontalCenter,
    XTImageHorizontalRight
}XTImageHorizontal;


NS_ASSUME_NONNULL_BEGIN

@interface UIImage (XTExtend)

- (UIImage *)xt_imageForSize:(CGSize)size;
- (UIImage *)xt_getSubImage:(CGRect)rect;
- (UIImage *)xt_scaleToSmallOfSize:(CGSize)size;
- (UIImage *)xt_scaleToBigOfSize:(CGSize)size;

+ (UIImage *)xt_imageWithColor:(UIColor *)color;
+ (UIImage *)xt_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)xt_resizedImageWithName:(NSString *)name;
+ (UIImage *)xt_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
- (UIImage *)xt_resizedImageWithLeft:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)xt_roundImageWithImage:(UIImage *)image cornerRadius:(CGFloat)radius;

- (UIImage *)xt_tintImageWithColor:(UIColor *)tintColor;

//按宽度等比例缩放（给定宽度）
- (UIImage*)xt_scaleToSmallWithWidth:(CGFloat)aWidth;

//按规定的尺寸（给定宽高）裁剪图片
//1.若图片原本宽高比大于规定的宽高比，则先将图片缩小的高度缩小／放大到规定高度，再对宽度进行裁剪，裁剪原则：vertical
//1.若图片原本宽高比小于规定的宽高比，则先将图片缩小的宽度缩小／放大到规定宽度，再对高度进行裁剪，裁剪原则：horizontal
- (UIImage *)xt_imageForSize:(CGSize)size vertical:(XTImageVertical)vertical horizontal:(XTImageHorizontal)horizontal;

/** 根据图片生成一张宽度或者高度跟屏幕适配的图片 */
+ (UIImage *)xt_imageByScalingToMaxSize:(UIImage *)sourceImage;

/**
 ScaleAspectFit 模式下尺寸
 
 @param size 视图的尺寸
 @return 合适的尺寸
 */
- (CGSize)xt_scaleAspectFitAsSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
