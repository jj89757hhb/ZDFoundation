//
//  UIApplication+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (XTExtend)

/// "Documents" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *xt_documentsURL;
@property (nonatomic, readonly) NSString *xt_documentsPath;

/// "Caches" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *xt_cachesURL;
@property (nonatomic, readonly) NSString *xt_cachesPath;

/// "Library" folder in this app's sandbox.
@property (nonatomic, readonly) NSURL *xt_libraryURL;
@property (nonatomic, readonly) NSString *xt_libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nullable, nonatomic, readonly) NSString *xt_appBundleName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nullable, nonatomic, readonly) NSString *xt_appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nullable, nonatomic, readonly) NSString *xt_appVersion;

/// Application's Build number. e.g. "123"
@property (nullable, nonatomic, readonly) NSString *xt_appBuildVersion;

/// Current thread real memory used in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t xt_memoryUsage;

/// Current thread CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float xt_cpuUsage;


+ (BOOL)xt_isAppExtension;

+ (nullable UIApplication *)xt_sharedExtensionApplication;

@end

NS_ASSUME_NONNULL_END
