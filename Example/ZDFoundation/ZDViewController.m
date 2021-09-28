//
//  ZDViewController.m
//  ZDFoundation
//
//  Created by jj89757hhb on 07/29/2019.
//  Copyright (c) 2019 jj89757hhb. All rights reserved.
//

#import "ZDViewController.h"
#import <ZDFoundation/ZDFoundation.h>
#import "ZDTestCell.h"
#import "ZDHeaderView.h"
@interface ZDViewController ()
@property (nonatomic,strong)  UITableView *table;
@end

@implementation ZDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpTable{
     _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_table];
    HeaderViewSection *section = [HeaderViewSection section];
    [section setFooterHeight:^CGFloat(__kindof ZDTableSection *sectionData, ZDTableViewProxy *proxy, NSUInteger section) {
        return 0.01;
    }];
//    ZDTableSection *section = [ZDTableSection section];
    for (int i =0; i<10; i++) {
        [section addObject:[self testRow]];
    }
    _table.ZDProxy = [ZDTableViewProxy proxyWithTableView:_table];
    [_table.ZDProxy setSectionIndexTitlesForTableView:^NSArray *(UITableView *tableView) {
        return @[@"A",@"B",@"C",@"D"
        ];
    }];
    
    [_table.ZDProxy setSectionForSectionIndexTitle:^NSInteger(NSString *title, NSInteger index) {
        NSLog(@"index1:%d",index);
        return index;
    }];//注意2两个回调要写在 reload的前面
    [_table.ZDProxy reloadData:@[section,section,section,section]];
  
}

- (ZDTestRow *)testRow{
    ZDTestRow *row = [ZDTestRow row];
    return row;
}
@end
