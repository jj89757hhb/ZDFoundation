//
//  XTTableViewProxy.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "XTTableRow.h"
#import "XTTableSection.h"

@interface XTTableViewProxy : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, weak) id <UITableViewDataSource> dataSource;
@property (nonatomic, weak) id <UITableViewDelegate> delegate;
/// 特定结构的数据源
@property (nonatomic, copy, readonly) NSArray <XTTableSection <XTTableRow *> *> *data;

/**
 工厂方法
 */
+ (instancetype)proxyWithTableView:(UITableView *)tableView;

/**
 禁用初始化方法
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 初始化方法，会赋值tableView的Delegate及DataSource到当前Proxy
 */
- (instancetype)initWithTableView:(UITableView *)tableView;

/**
 重新加载数据，会强制赋值tableView的Delegate及DataSource为当前Proxy
 @param data 嵌套的列表数据
 */
- (void)reloadData:(NSArray <XTTableSection <XTTableRow *>*>*)data;
@end

@interface UITableView (XTTableViewProxy)
@property (nonatomic, strong) XTTableViewProxy *XTProxy;
@end

@interface UIViewController (XTTableViewProxy)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
