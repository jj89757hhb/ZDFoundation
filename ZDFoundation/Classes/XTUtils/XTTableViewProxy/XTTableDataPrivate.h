//
//  XTTableDataPrivate.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "XTDataProxy.h"

@class XTTableRow;
@class XTTableViewProxy;

@protocol XTTableViewProxyPrivate <XTDataProxy>
/// 数据与view绑定
- (void)XTBindTableData:(id <XTDataPrivate>)data forView:(__kindof UIView *)view;
/// 数据与view解绑
- (void)XTUnbindTableDataForView:(__kindof UIView *)view;
/// 解绑所有
- (void)XTUnbindAllTableData;
@end

@interface UITableViewCell (XTTableViewDataPrivate)
@property (nonatomic, strong) XTTableViewProxy <XTTableViewProxyPrivate>*XTTableProxy;
// cell通过row展示
- (void)XTDisplayTableRow:(XTTableRow *)row;
@end
