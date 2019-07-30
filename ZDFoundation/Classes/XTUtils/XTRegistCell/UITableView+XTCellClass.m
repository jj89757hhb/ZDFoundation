//
//  UITableView+XTCellClass.m
//  XTNetwork
//
//  Created by Topredator on 2019/4/11.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "UITableView+XTCellClass.h"

@implementation UITableView (XTCellClass)
- (void)XTRegisterCells:(NSArray <XTCellClassType *>*)cells {
    if (!cells.count) return;
    for (XTCellClassType *type in cells) {
        [self registerClass:NSClassFromString(type.className) forCellReuseIdentifier:type.resueIdentifier];
    }
}
- (void)XTRegisterXibCells:(NSArray <XTCellClassType *>*)xibCells {
    if (!xibCells.count) return;
    for (XTCellClassType *type in xibCells) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:type.resueIdentifier];
    }
}
@end
