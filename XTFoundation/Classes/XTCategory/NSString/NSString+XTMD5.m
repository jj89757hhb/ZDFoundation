//
//  NSString+XTMD5.m
//  XTNetwork
//
//  Created by Topredator on 2019/4/10.
//  Copyright © 2019 mistong. All rights reserved.
//

#import "NSString+XTMD5.h"
#import <CommonCrypto/CommonDigest.h>
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(NSString_XTMD5)

@implementation NSString (XTMD5)
- (NSString *)XTMD5 {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
