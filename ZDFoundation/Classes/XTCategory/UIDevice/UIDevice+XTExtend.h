//
//  UIDevice+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/6.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (XTExtend)
// 获取设备型号然后手动转化为对应名称
+ (NSString *)getDeviceName;
@end

NS_ASSUME_NONNULL_END
