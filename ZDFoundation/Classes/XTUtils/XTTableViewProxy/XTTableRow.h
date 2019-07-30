//
//  XTTableRow.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "XTModelID.h"

@class XTTableRow;
@class XTTableViewProxy;
UIKIT_EXTERN NSString *const XTRerenderTableCellNotify;

/// cell高
typedef CGFloat (^XTTableCellHeightBlock)(__kindof XTTableRow *rowData, XTTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell将要出现
typedef void (^XTTableCellWillDisplayBlock)(__kindof XTTableRow *rowData, __kindof UITableViewCell *cell, XTTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 初始化
typedef void (^XTTableCellPreparedBlock)(__kindof XTTableRow *rowData, __kindof UITableViewCell *cell, XTTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 点击
typedef void (^XTTableCellDidSelectedBlock)(__kindof XTTableRow *rowData, XTTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 是否可编辑
typedef BOOL (^XTTableCellCanEditBlock)(__kindof XTTableRow *rowData, XTTableViewProxy *proxy, NSIndexPath *indexPath);
/// cell 编辑提交
typedef void (^XTTableCellCommitEditingBlock)(__kindof XTTableRow *rowData, UITableViewCellEditingStyle editingStyle, XTTableViewProxy *proxy, NSIndexPath *indexPath);

/// tableviewRow 协议
@protocol XTTableViewRowDelegate <NSObject>
- (CGFloat)XTTableViewCellHeightWithProxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)XTTableViewCellWillDisplay:(__kindof UITableViewCell *)cell proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)XTTableViewPreparedCell:(__kindof UITableViewCell *)cell proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)XTTableViewCellDidSelected:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (BOOL)XTTableViewCanEditRowWithProxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
- (void)XTTableViewCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
@optional
/// 将要重用
- (void)XTTableViewCellWillReuse:(__kindof UITableViewCell *)cell proxy:(XTTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath;
@end
@interface XTTableRow : NSObject <XTModelID, XTTableViewRowDelegate>
/// 额外信息，默认为nil
@property (nonatomic, strong) NSDictionary *infoDictionary;
/// 注册cell的类
@property (nonatomic, readonly) Class cellClass;
/// cell的重用标识符
@property (nonatomic, readonly) NSString *cellReuseID;
/// 当前显示的cell，当cell被重用时置空
@property (nonatomic, weak, readonly) __kindof UITableViewCell *cell;
/// 获取cell高度
@property (nonatomic, assign) XTTableCellHeightBlock cellHeight;
/// cell初始化
@property (nonatomic, copy) XTTableCellPreparedBlock cellPrepared;
/// cell将要显示
@property (nonatomic, copy) XTTableCellWillDisplayBlock cellWillDisplay;
/// cell被选中
@property (nonatomic, copy) XTTableCellDidSelectedBlock cellDidSelected;
/// cell是否可以编辑
@property (nonatomic, copy) XTTableCellCanEditBlock cellCanEdit;
/// cell提交编辑
@property (nonatomic, copy) XTTableCellCommitEditingBlock cellCommitEditing;

+ (instancetype)row;
+ (instancetype)rowWithID:(id<NSCopying>)rowid;
- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithID:(id<NSCopying>)rowid;

/**
 注册cell的类，并使用类名作为重用表示符
 */
- (void)setCellClass:(Class)cellClass;

/**
 注册cell的类
 @param reuseID 重用表示符。如果为nil，使用类名作为重用表示符
 */
- (void)setCellClass:(Class)cellClass forReuseID:(NSString *)reuseID;

/**
 重新渲染cell样式，如果cell未被重用，会触发当前数据源内部的“CKTableViewWillDisplayCell:withTableView:indexPath:”方法
 */
- (void)displayCell;
@end


