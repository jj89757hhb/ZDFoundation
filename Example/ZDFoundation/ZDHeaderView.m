//
//  ZDHeaderView.m
//  ZDFoundation_Example
//
//  Created by hhb201708 on 2021/3/8.
//  Copyright © 2021 jj89757hhb. All rights reserved.
//

#import "ZDHeaderView.h"

@implementation ZDHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleL];
    }
    return self;
}

- (UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 20)];
    }
    return _titleL;
}
@end

@implementation HeaderViewSection

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setHeaderClass:[ZDHeaderView class]];
    }
    return self;
}

- (void)ZDTableViewHeader:(__kindof ZDHeaderView *)header preparedWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section{
    header.titleL.text = _title;
}

//- (NSString *)ZD_TitleForHeaderInSectionWithProxy:(ZDTableViewProxy *)proxy titleForHeaderInSection:(NSInteger)section{
//    if (section==0) {
//        return @"A";
//    }else if (section==1){
//        return @"B";
//    }else if (section==2){
//        return @"C";
//    }else if (section==3){
//        return @"D";
//    }
//    return _title;
//}

- (CGFloat)ZDTableViewHeaderHeightWithProxy:(ZDTableViewProxy *)proxy section:(NSUInteger)section{
    return 44;
}
@end
