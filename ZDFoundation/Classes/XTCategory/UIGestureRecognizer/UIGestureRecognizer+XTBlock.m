//
//  UIGestureRecognizer+XTBlock.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIGestureRecognizer+XTBlock.h"
#import <objc/runtime.h>

#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIGestureRecognizer_XTBlock)

static const int xt_block_key;

@interface _XTUIGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _XTUIGestureRecognizerBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (_block) _block(sender);
}

@end

@implementation UIGestureRecognizer (XTBlock)

- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    [self xt_addActionBlock:block];
    return self;
}

- (void)xt_addActionBlock:(void (^)(id sender))block {
    _XTUIGestureRecognizerBlockTarget *target = [[_XTUIGestureRecognizerBlockTarget alloc] initWithBlock:block];
    [self addTarget:target action:@selector(invoke:)];
    NSMutableArray *targets = [self _xt_allUIGestureRecognizerBlockTargets];
    [targets addObject:target];
}

- (void)xt_removeAllActionBlocks{
    NSMutableArray *targets = [self _xt_allUIGestureRecognizerBlockTargets];
    [targets enumerateObjectsUsingBlock:^(id target, NSUInteger idx, BOOL *stop) {
        [self removeTarget:target action:@selector(invoke:)];
    }];
    [targets removeAllObjects];
}

- (NSMutableArray *)_xt_allUIGestureRecognizerBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &xt_block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &xt_block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
