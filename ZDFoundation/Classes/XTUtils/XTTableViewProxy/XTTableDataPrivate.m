//
//  XTTableDataPrivate.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTTableDataPrivate.h"
#import "XTTableViewProxy.h"
#import "XTTableRow.h"
#import <objc/runtime.h>
#import "XTFoundationMethodSwizlling.h"


static char kXTTableProxyKey;
@implementation UITableViewCell (XTTableViewDataPrivate)
+ (void)load {
    XTFoundationSwizzling(self, @selector(prepareForReuse), @selector(xt_prepareForReuse));
}
- (void)xt_prepareForReuse {
    XTTableRow *row = [self.XTTableProxy.dataBindingMap objectForKey:self];
    if (row && [row respondsToSelector:@selector(XTTableViewCellWillDisplay:proxy:indexPath:)]) {
        NSIndexPath *indexPath = [self.XTTableProxy.tableView indexPathForCell:self];
        [row XTTableViewCellWillDisplay:self proxy:self.XTTableProxy indexPath:indexPath];
    }
    [self.XTTableProxy XTUnbindTableDataForView:self];
    [self xt_prepareForReuse];
}
- (XTTableViewProxy<XTTableViewProxyPrivate> *)XTTableProxy {
    return objc_getAssociatedObject(self, &kXTTableProxyKey);
}
- (void)setXTTableProxy:(XTTableViewProxy<XTTableViewProxyPrivate> *)XTTableProxy {
    objc_setAssociatedObject(self, &kXTTableProxyKey, XTTableProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)XTDisplayTableRow:(XTTableRow *)row {
    UITableView *tableView = self.XTTableProxy.tableView;
    if (tableView.delegate && [tableView.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        NSIndexPath *indexPath = [tableView indexPathForCell:self];
        [tableView.delegate tableView:tableView willDisplayCell:self forRowAtIndexPath:indexPath];
    }
}
@end
