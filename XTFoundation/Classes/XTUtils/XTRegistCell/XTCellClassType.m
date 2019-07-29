//
//  XTCellClassType.m
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/13.
//  Copyright © 2019 XT. All rights reserved.
//

#import "XTCellClassType.h"

@implementation XTCellClassType
+ (instancetype)XT_CellClassTypeWithClassName:(NSString *)className resueIdentifier:(NSString *)resueIdentifier {
    XTCellClassType *type = [[self class] new];
    type.className = className;
    type.resueIdentifier = resueIdentifier.length ? resueIdentifier : className;
    return type;
}
+ (instancetype)XT_CellClassTypeWithClassName:(NSString *)className {
    return [self XT_CellClassTypeWithClassName:className resueIdentifier:nil];
}
@end
