//
//  UITableView+XTCellClass.h
//  XTNetwork
//
//  Created by Topredator on 2019/4/11.
//  Copyright © 2019 mistong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XTCellClassType.h"

@interface UITableView (XTCellClass)

/**
 注册cell

 @param cells 存储用于cell重用的对象
 */
- (void)XTRegisterCells:(NSArray <XTCellClassType *>*)cells;

/**
 注册xib创建的cell

 @param xibCells 存储用于cell重用的对象
 */
- (void)XTRegisterXibCells:(NSArray <XTCellClassType *>*)xibCells;
@end

