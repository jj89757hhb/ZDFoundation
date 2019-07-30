//
//  XTTableRow.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTTableRow.h"
#import "XTTableDataPrivate.h"
#import "XTTableViewProxy.h"

NSString *const XTRerenderTableCellNotify = @"com.xuetian.xtfoundation.notify.RerenderTableCell";

@interface XTTableRow () <XTDataPrivate>
@property (nonatomic, copy) id mIdentity;
@end

@implementation XTTableRow
+ (instancetype)row {
    return [[self alloc] init];
}
+ (instancetype)rowWithID:(id<NSCopying>)rowid {
    return [[self alloc] initWithID:rowid];
}
- (instancetype)init {
    self = [super init];
    return self;
}
- (instancetype)initWithID:(id<NSCopying>)rowid {
    if ((self = [self init])) {
        self.mIdentity = rowid;
    }
    return self;
}
- (id)identity {
    return self.mIdentity;
}
- (void)setCell:(UITableViewCell *)cell {
    _cell = cell;
}
- (void)displayCell {
    [self.cell XTDisplayTableRow:self];
}
- (void)setCellClass:(Class)cellClass {
    [self setCellClass:cellClass forReuseID:nil];
}
- (void)setCellClass:(Class)cellClass forReuseID:(NSString *)reuseID {
    _cellClass = cellClass;
    _cellReuseID = reuseID ?: NSStringFromClass(cellClass);
}
#pragma mark ==================  XTTableViewRowDelegate   ==================
- (CGFloat)XTTableViewCellHeightWithProxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellHeight) {
        return self.cellHeight(self, proxy, indexPath);
    }
    return UITableViewAutomaticDimension;
}
- (void)XTTableViewCellWillDisplay:(__kindof UITableViewCell *)cell proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellWillDisplay) {
        self.cellWillDisplay(self, cell, proxy, indexPath);
    }
}
- (void)XTTableViewPreparedCell:(__kindof UITableViewCell *)cell proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellPrepared) {
        self.cellPrepared(self, cell, proxy, indexPath);
    }
}
- (void)XTTableViewCellDidSelected:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellDidSelected) {
        self.cellDidSelected(self, proxy, indexPath);
    }
}
- (BOOL)XTTableViewCanEditRowWithProxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellCanEdit) {
        return self.cellCanEdit(self, proxy, indexPath);
    }
    return NO;
}
- (void)XTTableViewCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath {
    if (self.cellCommitEditing) {
        self.cellCommitEditing(self, editingStyle, proxy, indexPath);
    }
}

#pragma mark ==================  XTDataPrivate   ==================

- (void)XTBindView:(__kindof UIView *)view dataProxy:(XTTableViewProxy <XTTableViewProxyPrivate>*)dataProxy {
    NSAssert(view, @"XTTableRow bind cell fail：cell is empty!");
    if (self.cell) {
        [dataProxy XTUnbindTableDataForView:self.cell];
    }
    self.cell = view;
}
- (void)XTUnbindViewWithProxy:(id<XTDataProxy>)proxy {
    NSAssert(self.cell, @"XTTableRow unbind cell fail：cell is empty!");
    self.cell = nil;
}
@end
