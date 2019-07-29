//
//  XTDispatchQueuePool.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef XTDispatchQueuePool_h
#define XTDispatchQueuePool_h

NS_ASSUME_NONNULL_BEGIN

@interface XTDispatchQueuePool : NSObject
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/**
 Creates and returns a dispatch queue pool.
 @param name       The name of the pool.
 @param queueCount Maxmium queue count, should in range (1, 32).
 @param qos        Queue quality of service (QOS).
 @return A new pool, or nil if an error occurs.
 */
- (instancetype)initWithName:(nullable NSString *)name queueCount:(NSUInteger)queueCount qos:(NSQualityOfService)qos;

/// Pool's name.
@property (nullable, nonatomic, readonly) NSString *name;

/// Get a serial queue from pool.
- (dispatch_queue_t)queue;

+ (instancetype)defaultPoolForQOS:(NSQualityOfService)qos;

@end

/// Get a serial queue from global queue pool with a specified qos.
extern dispatch_queue_t XTDispatchQueueGetForQOS(NSQualityOfService qos);

NS_ASSUME_NONNULL_END

#endif
