//
//  XTCellClassType.h
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/13.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XTCellClassType : NSObject
/// 类名
@property (nonatomic, copy) NSString * className;
/// 重用标识符
@property (nonatomic, copy) NSString *resueIdentifier;

/**
 通过类名、标识符 初始化重用的对象
 
 @param className 类名
 @param resueIdentifier 标识符
 @return 用于重用的对象
 */
+ (instancetype)XT_CellClassTypeWithClassName:(NSString *)className resueIdentifier:(NSString *)resueIdentifier;
+ (instancetype)XT_CellClassTypeWithClassName:(NSString *)className;
@end

NS_INLINE XTCellClassType *XTCellType(NSString *className, NSString *resueIdentifier) {
    return [XTCellClassType XT_CellClassTypeWithClassName:className resueIdentifier:resueIdentifier.length ? resueIdentifier : className];
}
NS_INLINE XTCellClassType *XTCellCType(NSString *className) {
     return [XTCellClassType XT_CellClassTypeWithClassName:className];
}
