//
//  XTViewController.m
//  XTFoundation
//
//  Created by Topredator on 06/11/2019.
//  Copyright (c) 2019 Topredator. All rights reserved.
//

#import "XTViewController.h"
#import <XTFoundation/XTFoundation.h>

@interface XTViewController ()

@end

@implementation XTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *str = @"2019-07-01";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [formatter dateFromString:str];
    BOOL isSameWeek = [date xt_isSameWeek];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
