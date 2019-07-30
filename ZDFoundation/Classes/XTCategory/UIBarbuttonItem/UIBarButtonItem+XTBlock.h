//
//  UIBarButtonItem+XTBlock.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (XTBlock)

@property (nullable, nonatomic, copy) void (^xt_actionBlock)(id);

@end

NS_ASSUME_NONNULL_END
