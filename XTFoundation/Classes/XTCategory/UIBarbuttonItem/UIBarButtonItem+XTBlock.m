//
//  UIBarButtonItem+XTBlock.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIBarButtonItem+XTBlock.h"
#import <objc/runtime.h>
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIBarButtonItem_XTBlock)
static const int xt_block_key;

@interface _XTUIBarButtonItemBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

@end

@implementation _XTUIBarButtonItemBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

@end


@implementation UIBarButtonItem (XTBlock)

- (void)setXt_actionBlock:(void (^)(id sender))block {
    _XTUIBarButtonItemBlockTarget *target = [[_XTUIBarButtonItemBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &xt_block_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTarget:target];
    [self setAction:@selector(invoke:)];
}

- (void (^)(id)) xt_actionBlock {
    _XTUIBarButtonItemBlockTarget *target = objc_getAssociatedObject(self, &xt_block_key);
    return target.block;
}
@end
