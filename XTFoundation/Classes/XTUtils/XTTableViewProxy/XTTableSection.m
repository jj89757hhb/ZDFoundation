//
//  XTTableSection.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTTableSection.h"
#import "XTTableViewProxy.h"

NSString *const XTRerenderTableSectionHeaderNotify = @"com.xuetian.xtfoundation.notify.RerenderTableSectionHeader";
NSString *const XTRerenderTableSectionFooterNotify = @"com.xuetian.xtfoundation.notify.RerenderTableSectionFooter";

@implementation XTTableSection
+ (instancetype)section {
    return [[self alloc] initWithID:nil];
}

+ (instancetype)sectionWithID:(id<NSCopying>)identity {
    return [[self alloc] initWithID:identity];
}

- (void)setHeaderClass:(Class)headerClass {
    [self setHeaderClass:headerClass withReuseID:nil];
}

- (void)setHeaderClass:(Class)headerClass withReuseID:(NSString *)identifier {
    _headerClass = headerClass;
    _headerReuseID = identifier ?: NSStringFromClass(headerClass);
}

- (void)setFooterClass:(Class)footerClass {
    [self setFooterClass:footerClass withReuseID:nil];
}

- (void)setFooterClass:(Class)footerClass withReuseID:(NSString *)identifier {
    _footerClass = footerClass;
    _footerReuseID = identifier ?: NSStringFromClass(footerClass);
}

- (void)rerenderHeader {
    [[NSNotificationCenter defaultCenter] postNotificationName:XTRerenderTableSectionHeaderNotify object:self];
}

- (void)rerenderFooter {
    [[NSNotificationCenter defaultCenter] postNotificationName:XTRerenderTableSectionFooterNotify object:self];
}
#pragma mark ==================  XTTableViewSectionDelegate   ==================
- (CGFloat)XTTableViewHeaderHeightWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.headerHeight) {
        return self.headerHeight(self, proxy, section);
    }
    return UITableViewAutomaticDimension;
}
- (CGFloat)XTTableViewFooterHeightWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.footerHeight) {
        return self.footerHeight(self, proxy, section);
    }
    return UITableViewAutomaticDimension;
}
- (void)XTTableViewHeader:(__kindof UITableViewHeaderFooterView *)header preparedWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.headerPrepared) {
        self.headerPrepared(self, header, proxy, section);
    }
}
- (void)XTTableViewFooter:(__kindof UITableViewHeaderFooterView *)footer preparedWithProxy:(XTTableViewProxy *)proxy section:(NSUInteger)section {
    if (self.footerPrepared) {
        self.footerPrepared(self, footer, proxy, section);
    }
}
@end

@implementation NSArray (XTTableSection)
- (XTTableSection *)tableSection {
    return [[XTTableSection alloc] initWithArray:self];
}

@end
