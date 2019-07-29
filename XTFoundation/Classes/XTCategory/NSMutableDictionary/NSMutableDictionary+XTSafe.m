//
//  NSMutableDictionary+XTSafe.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import "NSMutableDictionary+XTSafe.h"
#import "XTFoundationMacro.h"

XTSYNTH_DUMMY_CLASS(NSDictionary_XTSafe)

@implementation NSDictionary (XTSafe)
- (id)xt_ObjectForKey:(id)key validatedByClass:(Class)objClass {
    id object = [self objectForKey:key];
    if (object && [object isKindOfClass:objClass]) {
        return object;
    }
    return nil;
}

- (NSString *)xt_StringObjectForKey:(id)key {
    return [self xt_ObjectForKey:key validatedByClass:NSString.class];
}
- (NSNumber *)xt_NumberObjectForKey:(id)key {
    return [self xt_ObjectForKey:key validatedByClass:NSNumber.class];
}
- (NSValue *)xt_ValueObjectForKey:(id)key {
    return [self xt_ObjectForKey:key validatedByClass:NSValue.class];
}
- (NSArray *)xt_ArrayObjectForKey:(id)key {
    return [self xt_ObjectForKey:key validatedByClass:NSArray.class];
}
- (NSDictionary *)xt_DictionaryObjectForKey:(id)key {
    return [self xt_ObjectForKey:key validatedByClass:NSDictionary.class];
}
- (BOOL)xt_BoolObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj boolValue];
    }
    return NO;
}
- (double)xt_DoubleObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj doubleValue];
    }
    return 0;
}
- (NSInteger)xt_IntegerObjectForKey:(id)key {
    id obj = [self objectForKey:key];
    if (obj && ([obj isKindOfClass:NSNumber.class] || [obj isKindOfClass:NSString.class])) {
        return [obj integerValue];
    }
    return 0;
}
@end


XTSYNTH_DUMMY_CLASS(NSMutableDictionary_XTSafe)

@implementation NSMutableDictionary (XTSafe)

- (void)xt_safetySetObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey)
    {
        [self setObject:anObject forKey:aKey];
    }
}

- (void)xt_safetyRemoveObjectForKey:(id)key
{
    if (key) {
        [self removeObjectForKey:key];
    }
}

@end
