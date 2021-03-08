//
//  ZDHeaderView.h
//  ZDFoundation_Example
//
//  Created by hhb201708 on 2021/3/8.
//  Copyright © 2021 jj89757hhb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZDFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZDHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) UILabel *titleL;
@end

@interface HeaderViewSection : ZDTableSection
@property (nonatomic,copy) NSString *title;
@end
NS_ASSUME_NONNULL_END
