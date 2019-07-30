//
//  UICollectionView+XTCellClass.h
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/13.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XTCellClassType.h"

@interface UICollectionView (XTCellClass)
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

- (void)XTRegisterXibSections:(NSArray<XTCellClassType *>*)xibSections elementKind:(NSString *)elementKind;
- (void)XTRegisterSections:(NSArray<XTCellClassType *>*)sections elementKind:(NSString *)elementKind;
@end
