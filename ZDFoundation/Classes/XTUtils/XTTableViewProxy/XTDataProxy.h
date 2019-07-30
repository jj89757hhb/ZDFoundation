//
//  XTDataProxy.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import <Foundation/Foundation.h>


/**
 数据代理协议
 */
@protocol XTDataProxy <NSObject>
- (NSMapTable *)dataBindingMap;
@end

/**
 私有的数据协议
 */
@protocol XTDataPrivate <NSObject>
- (void)XTBindView:(__kindof UIView *)view dataProxy:(id <XTDataProxy>)dataProxy;
- (void)XTUnbindViewWithProxy:(id <XTDataProxy>)proxy;
@end
