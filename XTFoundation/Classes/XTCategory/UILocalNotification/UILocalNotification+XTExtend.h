//
//  UILocalNotification+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/6.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILocalNotification (XTExtend)
+(void)createLocalNotificationTaskWithContent:(NSString*)content userInfo:(NSDictionary *)userInfo;
@end

