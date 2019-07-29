//
//  XTModelID.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTModelID.h"
NSString *const kXTModelIDKey = @"com.xuetian.foundation.data.identify";

NSString *XTMakeMemoryAddressIdentify(id obj) {
    void *ptr = (__bridge void *)(obj);
    return [NSString stringWithFormat:@"%p", ptr];
}

@implementation NSString (XTModelID)
- (id)identity {
    return self;
}
@end

@implementation NSNumber (XTModelID)
- (id)identity {
    return self;
}
@end

@implementation NSValue (XTModelID)
- (id)identity {
    return self;
}
@end

@implementation NSDictionary (XTModelID)
- (id)identity {
    return [self objectForKey:kXTModelIDKey];
}
@end
