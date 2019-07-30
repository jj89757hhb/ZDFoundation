//
//  UICollectionView+XTCellClass.m
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/13.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UICollectionView+XTCellClass.h"

@implementation UICollectionView (XTCellClass)
- (void)XTRegisterCells:(NSArray <XTCellClassType *>*)cells {
    if (!cells.count) return;
    for (XTCellClassType *type in cells) {
        [self registerClass:NSClassFromString(type.className) forCellWithReuseIdentifier:type.resueIdentifier];
    }
}
- (void)XTRegisterXibCells:(NSArray <XTCellClassType *>*)xibCells {
    if (!xibCells.count) return;
    for (XTCellClassType *type in xibCells) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forCellWithReuseIdentifier:type.resueIdentifier];
    }
}
- (void)XTRegisterXibSections:(NSArray<XTCellClassType *>*)xibSections elementKind:(NSString *)elementKind {
    if (!xibSections.count) return;
    for (XTCellClassType *type in xibSections) {
        UINib *nib = [UINib nibWithNibName:type.className bundle:nil];
        [self registerNib:nib forSupplementaryViewOfKind:elementKind withReuseIdentifier:type.resueIdentifier];
    }
}
- (void)XTRegisterSections:(NSArray<XTCellClassType *>*)sections elementKind:(NSString *)elementKind {
    if (!sections.count) return;
    for (XTCellClassType *type in sections) {
        [self registerClass:NSClassFromString(type.className) forSupplementaryViewOfKind:elementKind withReuseIdentifier:type.resueIdentifier];
    }
}


@end
