//
//  NSMutableDictionary+XTSafe.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 字典的扩展
 支持取值后直接转化 BOOL/double/NSInteger 类型
 */
@interface NSDictionary (XTSafe)
/**
 获取字段的对象，并根据对象的类型进行验证对象的合法性
 
 @param key 对象的键值
 @param objClass 对象的值
 @return 对象验证失败返回nil，成功返回对象
 */
- (id)xt_ObjectForKey:(id)key validatedByClass:(Class)objClass;

- (NSString *)xt_StringObjectForKey:(id)key;
- (NSNumber *)xt_NumberObjectForKey:(id)key;
- (NSValue *)xt_ValueObjectForKey:(id)key;
- (NSArray *)xt_ArrayObjectForKey:(id)key;
- (NSDictionary *)xt_DictionaryObjectForKey:(id)key;
- (BOOL)xt_BoolObjectForKey:(id)key;
- (double)xt_DoubleObjectForKey:(id)key;
- (NSInteger)xt_IntegerObjectForKey:(id)key;
@end


@interface NSMutableDictionary (XTSafe)
- (void)xt_safetySetObject:(id)anObject forKey:(id)aKey;
- (void)xt_safetyRemoveObjectForKey:(id)key;

@end

