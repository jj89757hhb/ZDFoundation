//
//  NSMutableArray+XTSafe.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import "NSMutableArray+XTSafe.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(NSMutableArray_XTSafe)

@implementation NSArray (XTSafe)
/// 获取index的值
- (id)xt_ObjectAtIndex:(NSUInteger)index {
    if (self.count <= index) return nil;
    return [self objectAtIndex:index];
}
/// 安全拼接数组
- (NSArray *)xt_arrayByAddingObjectsFromArray:(NSArray *)otherArray {
    NSArray *array;
    if (otherArray) {
        array = [self arrayByAddingObjectsFromArray:otherArray];
    }
    return array ?: self;
}
/// 创建数组
+ (instancetype)createSafetyArrayWithObject:(id)anObject {
    if (anObject) {
        return [self arrayWithObject:anObject];
    }
    return [self array];
}
@end


@implementation NSMutableArray (XTSafe)

#pragma mark - Add
- (BOOL)xt_safetyAddObject:(id)object {
    if (object) {
        [self addObject:object];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        return NO;
    }
    if (self.count <= index) {
        [self addObject:anObject];
    }
    else {
        [self insertObject:anObject atIndex:index];
    }
    return YES;
}

- (BOOL)xt_safetyAddObjectsFromArray:(NSArray *)otherArray {
    if (!otherArray) {
        return NO;
    }
    [self addObjectsFromArray:otherArray];
    return YES;
}
#pragma mark - Remove
- (BOOL)xt_safetyRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= index) {
        return NO;
    }
    [self removeObjectAtIndex:index];
    return YES;
}

- (BOOL)xt_safetyRemoveObjectsAfterIndex:(NSUInteger)index {
    NSInteger count = self.count;
    if (index < count) {
        NSRange range = NSMakeRange(index, count-index);
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyRemoveObjectsBeforeIndex:(NSUInteger)index {
    NSInteger count = self.count;
    if (index < count) {
        NSRange range = NSMakeRange(0, index+1);
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyRemoveObjectsInRange:(NSRange)range {
    if (range.location + range.length <= self.count) {
        [self removeObjectsInRange:range];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyRemoveObjectsAtIndexes:(NSIndexSet *)indexes {
    if (indexes && indexes.lastIndex < self.count) {
        [self removeObjectsAtIndexes:indexes];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyRemoveObject:(id)object {
    if (object && [self containsObject:object]) {
        [self removeObject:object];
        return YES;
    }
    return NO;
}

#pragma mark - Change
- (BOOL)xt_safetyReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 < self.count && idx2 < self.count && idx1 != idx2) {
        [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
        return YES;
    }
    return NO;
}

- (BOOL)xt_safetyMoveObjectAtIndex:(NSUInteger)idx1 toIndex:(NSUInteger)idx2 {
    if (idx1 < self.count && idx2 < self.count && idx1 != idx2) {
        id obj = [self objectAtIndex:idx1];
        [self removeObjectAtIndex:idx1];
        [self insertObject:obj atIndex:idx2];
        return YES;
    }
    return NO;
}

@end
