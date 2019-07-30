//
//  XTTableSection.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//
#import "XTMutableArray.h"
@class XTTableViewProxy;
@class XTTableSection;

UIKIT_EXTERN NSString *const XTRerenderTableSectionHeaderNotify;
UIKIT_EXTERN NSString *const XTRerenderTableSectionFooterNotify;

/// section的高
typedef CGFloat (^XTTableSectionHeightBlock)(__kindof XTTableSection *sectionData, XTTableViewProxy *proxy, NSUInteger section);
/// section header/footer 展示
typedef void (^XTTableSectionPreparedBlock)(__kindof XTTableSection *sectionData, __kindof UITableViewHeaderFooterView *view, XTTableViewProxy *proxy, NSUInteger section);

/// section协议
@protocol XTTableViewSectionDelegate <NSObject>
/// 分区header 的高
- (CGFloat)XTTableViewHeaderHeightWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区footer的高
- (CGFloat)XTTableViewFooterHeightWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区header 初始化
- (void)XTTableViewHeader:(__kindof UITableViewHeaderFooterView *)header preparedWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section;
/// 分区footer 初始化
- (void)XTTableViewFooter:(__kindof UITableViewHeaderFooterView *)footer preparedWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section;
@end


@interface XTTableSection<__covariant ObjectType> : XTMutableArray<XTTableViewSectionDelegate>
/// 额外信息，默认为nil
@property (nonatomic, strong) NSDictionary *infoDictionary;
/// SectionHeaderView的类，如果为nil，则显示系统默认header
@property (nonatomic, readonly) Class headerClass;
/// SectionHeaderView的重用标识符
@property (nonatomic, readonly) NSString *headerReuseID;
/// 获取SectionHeader的高度，默认为UITableView
@property (nonatomic, assign) XTTableSectionHeightBlock headerHeight;
/// SectionHeader初始化
@property (nonatomic, copy) XTTableSectionPreparedBlock headerPrepared;

/// SectionFooterView的类，如果为nil，则显示系统默认footer
@property (nonatomic, readonly) Class footerClass;
/// SectionHeaderView的重用标识符
@property (nonatomic, readonly) NSString *footerReuseID;
/// 获取SectionFooter的高度
@property (nonatomic, assign) XTTableSectionHeightBlock footerHeight;
/// SectionFooter初始化
@property (nonatomic, copy) XTTableSectionPreparedBlock footerPrepared;

+ (instancetype)section;
+ (instancetype)sectionWithID:(id<NSCopying>)sid;

/**
 重新渲染SectionHeader视图
 如果当前数据源代表的SectionHeader没有被重用，会在强制触发当前数据源内部的“CKTableViewHeader:preparedWithTableView:”方法
 */
- (void)rerenderHeader;

/**
 重新渲染SectionFooter视图
 如果当前数据源代表的SectionFooter没有被重用，会在强制触发当前数据源内部的“CKTableViewFooter:preparedWithTableView:”方法
 */
- (void)rerenderFooter;

/**
 注册SectionHeaderView的类，使用类名作为重用标识符
 */
- (void)setHeaderClass:(Class)headerClass;

/**
 注册SectionHeaderView的类，如果identifier为nil，使用类名作为重用标识符
 */
- (void)setHeaderClass:(Class)headerClass withReuseID:(NSString *)identifier;

/**
 注册SectionFooterView的类，使用类名作为重用标识符
 */
- (void)setFooterClass:(Class)footerClass;

/**
 注册SectionFooterView的类，如果identifier为nil，使用类名作为重用标识符
 */
- (void)setFooterClass:(Class)footerClass withReuseID:(NSString *)identifier;
@end

@interface NSArray (XTTableSection)
- (XTTableSection *)tableSection;
@end

