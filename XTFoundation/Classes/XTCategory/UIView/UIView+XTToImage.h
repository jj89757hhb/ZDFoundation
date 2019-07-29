//
//  UIView+XTToImage.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XTToImage)

- (nullable UIImage *)xt_snapshotImage;
- (nullable UIImage *)xt_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;


@end

NS_ASSUME_NONNULL_END
