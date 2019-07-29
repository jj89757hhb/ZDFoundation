//
//  XTTableViewProxy.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTTableViewProxy.h"
#import <objc/runtime.h>
#import "XTTableDataPrivate.h"
#import "XTMultipleProxy.h"
#import "NSMutableArray+XTSafe.h"


@interface XTTableViewProxy () <XTTableViewProxyPrivate>
@property (nonatomic, strong) XTMultipleProxy *dataSourceProxy;
@property (nonatomic, strong) XTMultipleProxy *delegateProxy;
@property (nonatomic, strong) NSMutableSet *headerFooterClassSet;
@property (nonatomic, strong) NSMutableSet *cellClassSet;
@property (nonatomic, weak) NSMapTable *dataBindingMap;
@end

@implementation XTTableViewProxy
- (void)dealloc {
    [self XTUnbindAllTableData];
}
+ (instancetype)proxyWithTableView:(UITableView *)tableView {
    return [[self alloc] initWithTableView:tableView];
}
- (instancetype)initWithTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    return self;
}
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
    _dataSource = dataSource;
    if (dataSource) {
        self.dataSourceProxy = [XTMultipleProxy proxyWithObjects:@[self, dataSource]];
        self.tableView.dataSource = (id)self.dataSourceProxy;
    } else {
        self.tableView.dataSource = self;
    }
}
- (void)setDelegate:(id<UITableViewDelegate>)delegate {
    _delegate = delegate;
    if (delegate) {
        self.delegateProxy = [XTMultipleProxy proxyWithObjects:@[self, delegate]];
        self.tableView.delegate = (id)self.delegateProxy;
    } else {
        self.tableView.delegate = self;
    }
}
- (void)reloadData:(NSArray <XTTableSection <XTTableRow *> *> *)data {
    [self XTUnbindAllTableData];
    _data = data;
    [self registeAllClassForData:data];
    [self.tableView reloadData];
}
#pragma mark ==================  Registe Classes   ==================
/// 注册 headers、footers、cells
- (void)registeAllClassForData:(NSArray <XTTableSection <XTTableRow *>*> *)data {
    [self registeCellClass:UITableViewCell.class reuseIdentifier:@"UITableViewCell"];
    for (XTTableSection *section in data) {
        [self registeSectionHeaderFooterViewClass:section.headerClass reuseIdentifier:section.headerReuseID];
        [self registeSectionHeaderFooterViewClass:section.footerClass reuseIdentifier:section.footerReuseID];
        for (XTTableRow *row in section) {
            [self registeCellClass:row.cellClass reuseIdentifier:row.cellReuseID];
        }
    }
}
- (void)registeCellClass:(Class)cellClass reuseIdentifier:(NSString *)identifier {
    if (cellClass && ![self.cellClassSet containsObject:identifier]) {
        [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
        [self.cellClassSet addObject:identifier];
    }
}
- (void)registeSectionHeaderFooterViewClass:(Class)viewClass reuseIdentifier:(NSString *)identifier {
    if (viewClass && ![self.headerFooterClassSet containsObject:identifier]) {
        [self.tableView registerClass:viewClass forHeaderFooterViewReuseIdentifier:identifier];
        [self.headerFooterClassSet addObject:identifier];
    }
}

#pragma mark ==================  XTTableViewProxyPrivate   ==================
/// 数据与view绑定
- (void)XTBindTableData:(id <XTDataPrivate>)data forView:(__kindof UIView *)view {
    [data XTBindView:view dataProxy:self];
    [self.dataBindingMap setObject:data forKey:view];
}
/// 数据与view解绑
- (void)XTUnbindTableDataForView:(__kindof UIView *)view {
    id <XTDataPrivate> data = [self.dataBindingMap objectForKey:view];
    if (data) {
        [data XTUnbindViewWithProxy:self];
        [self.dataBindingMap removeObjectForKey:view];
    }
}
/// 解绑所有
- (void)XTUnbindAllTableData {
    for (id <XTDataPrivate> data in self.dataBindingMap.objectEnumerator) {
        [data XTUnbindViewWithProxy:self];
    }
    [self.dataBindingMap removeAllObjects];
}

#pragma mark ==================  NSProxy   ==================
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [self.tableView methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:self.tableView];
}
#pragma mark ==================  UITableView dataSource and delegate  ==================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.data xt_ObjectAtIndex:section] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    return [row XTTableViewCellHeightWithProxy:self indexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    XTTableSection *data = [self.data xt_ObjectAtIndex:section];
    return [data XTTableViewHeaderHeightWithProxy:self section:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    XTTableSection *data = [self.data xt_ObjectAtIndex:section];
    return [data XTTableViewFooterHeightWithProxy:self section:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    XTTableSection *data = [self.data xt_ObjectAtIndex:section];
    if (!data.headerClass) return nil;
    
    NSString *identifier = data.headerReuseID;
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    [data XTTableViewHeader:view preparedWithProxy:self section:section];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    XTTableSection *data = [self.data xt_ObjectAtIndex:section];
    if (!data.footerClass) return nil;
    
    NSString *identifier = data.footerReuseID;
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    [data XTTableViewFooter:view preparedWithProxy:self section:section];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    NSString *identifier = row.cellClass ? row.cellReuseID : @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    /// 设置proxy属性 是为了在prepareForReuse 的时候需要获取cell所在的indexPath（可能会用到 因为是协议可选方法）
    cell.XTTableProxy = self;
    /// cell与row进行绑定
    [self XTBindTableData:(id <XTDataPrivate>)row forView:cell];
    [row XTTableViewPreparedCell:cell proxy:self indexPath:indexPath];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    return [row XTTableViewCanEditRowWithProxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    [row XTTableViewCommitEditingStyle:editingStyle proxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    [row XTTableViewCellWillDisplay:cell proxy:self indexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XTTableRow *row = [[self.data xt_ObjectAtIndex:indexPath.section] xt_ObjectAtIndex:indexPath.row];
    [row XTTableViewCellDidSelected:self indexPath:indexPath];
}
#pragma mark ==================  lazy method  ==================
- (NSMutableSet *)headerFooterClassSet {
    if (!_headerFooterClassSet) {
        _headerFooterClassSet = [NSMutableSet set];
    }
    return _headerFooterClassSet;
}
- (NSMutableSet *)cellClassSet {
    if (!_cellClassSet) {
        _cellClassSet = [NSMutableSet set];
    }
    return _cellClassSet;
}
- (NSMapTable *)dataBindingMap {
    if (!_dataBindingMap) {
        _dataBindingMap = [NSMapTable strongToStrongObjectsMapTable];
    }
    return _dataBindingMap;
}
@end

static char kXTProxyKey;
@implementation UITableView (XTTableViewProxy)
- (XTTableViewProxy *)XTProxy {
    return objc_getAssociatedObject(self, &kXTProxyKey);
}
- (void)setXTProxy:(XTTableViewProxy *)XTProxy {
    objc_setAssociatedObject(self, &kXTProxyKey, XTProxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

@implementation UIViewController (XTTableViewProxy)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableView.XTProxy tableView:tableView numberOfRowsInSection:section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView.XTProxy tableView:tableView cellForRowAtIndexPath:indexPath];
}
@end
