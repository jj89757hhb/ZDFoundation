//
//  XTModelID.h
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString *const kXTModelIDKey;

NSString *XTMakeMemoryAddressIdentify(id obj);

@protocol XTModelID <NSObject>
- (id)identity;
@end

@interface NSString (XTModelID) <XTModelID>
@end

@interface NSNumber (XTModelID) <XTModelID>
@end

@interface NSValue (XTModelID) <XTModelID>
@end

@interface NSDictionary (XTModelID) <XTModelID>
@end
