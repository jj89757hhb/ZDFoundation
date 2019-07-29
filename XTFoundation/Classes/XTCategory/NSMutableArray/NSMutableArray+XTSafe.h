//
//  NSMutableArray+XTSafe.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (XTSafe)
/// 获取index的值
- (id)xt_ObjectAtIndex:(NSUInteger)index;
/// 安全拼接数组
- (NSArray *)xt_arrayByAddingObjectsFromArray:(NSArray *)otherArray;
/// 创建数组
+ (instancetype)createSafetyArrayWithObject:(ObjectType)anObject;
@end


@interface NSMutableArray<ObjectType> (XTSafe)
#pragma mark - add
- (BOOL)xt_safetyAddObject:(ObjectType)object;
- (BOOL)xt_safetyAddObjectsFromArray:(NSArray *)otherArray;
- (BOOL)xt_safetyInsertObject:(ObjectType)anObject atIndex:(NSUInteger)index;

#pragma mark - remove
- (BOOL)xt_safetyRemoveObjectAtIndex:(NSUInteger)index;
- (BOOL)xt_safetyRemoveObject:(ObjectType)object;
/// 移除大于等于某个索引的所有对象
- (BOOL)xt_safetyRemoveObjectsAfterIndex:(NSUInteger)index;
/// 移除小于等于某个索引的所有对象
- (BOOL)xt_safetyRemoveObjectsBeforeIndex:(NSUInteger)index;
- (BOOL)xt_safetyRemoveObjectsInRange:(NSRange)range;
- (BOOL)xt_safetyRemoveObjectsAtIndexes:(NSIndexSet *)indexes;

#pragma mark - change
- (BOOL)xt_safetyExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (BOOL)xt_safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;
- (BOOL)xt_safetyMoveObjectAtIndex:(NSUInteger)idx1 toIndex:(NSUInteger)idx2;

@end

NS_ASSUME_NONNULL_END
