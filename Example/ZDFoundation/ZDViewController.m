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
    ZDTableSection *section = [ZDTableSection section];
    for (int i =0; i<10; i++) {
        [section addObject:[self testRow]];
    }
    _table.ZDProxy = [ZDTableViewProxy proxyWithTableView:_table];
    [_table.ZDProxy reloadData:@[section]];
}

- (ZDTestRow *)testRow{
    ZDTestRow *row = [ZDTestRow row];
    return row;
}
@end
