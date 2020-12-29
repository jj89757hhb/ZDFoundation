//
//  ZDTestCell.m
//  ZDFoundation_Example
//
//  Created by hhb201708 on 2020/12/29.
//  Copyright © 2020 jj89757hhb. All rights reserved.
//

#import "ZDTestCell.h"

@implementation ZDTestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.text = @"哈哈哈哈";
    }
    return self;
}

@end

@implementation ZDTestRow

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setCellClass:[ZDTestCell class]];
    }
    return self;
}

- (void)ZDTableViewPreparedCell:(__kindof UITableViewCell *)cell proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath{
    
}

- (BOOL)ZDTableViewCanEditRowWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)ZDTableViewCommitEditingStyle:(UITableViewCellEditingStyle)editingStyle proxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath{
    NSLog(@"我操作了");
}

- (NSArray *)ZD_editActionsWithProxy:(ZDTableViewProxy *)proxy indexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction*action0 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"移除"handler:^(UITableViewRowAction*action,NSIndexPath*indexPath) {
        NSLog(@"点击了关注");
        // 收回左滑出现的按钮(退出编辑模式)
        //            tableView.editing=NO;
    }];
    UITableViewRowAction*action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"置顶"handler:^(UITableViewRowAction*action,NSIndexPath*indexPath) {
        NSLog(@"点击了关注");
        // 收回左滑出现的按钮(退出编辑模式)
        //            tableView.editing=NO;
    }];
    action1.backgroundColor = [UIColor blueColor];
    return @[action0];
//    return @[action0,action1];
}

@end
