//
//  XTKeyboardManager.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct {
    BOOL fromVisible; ///< Keyboard visible before transition.
    BOOL toVisible;   ///< Keyboard visible after transition.
    CGRect fromFrame; ///< Keyboard frame before transition.
    CGRect toFrame;   ///< Keyboard frame after transition.
    NSTimeInterval animationDuration;       ///< Keyboard transition animation duration.
    UIViewAnimationCurve animationCurve;    ///< Keyboard transition animation curve.
    UIViewAnimationOptions animationOption; ///< Keybaord transition animation option.
} XTKeyboardTransition;

@protocol XTKeyboardObserver <NSObject>
@optional
- (void)keyboardChangedWithTransition:(XTKeyboardTransition)transition;
@end


@interface XTKeyboardManager : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

+ (nullable instancetype)defaultManager;

@property (nullable, nonatomic, readonly) UIWindow *keyboardWindow;

@property (nullable, nonatomic, readonly) UIView *keyboardView;

@property (nonatomic, readonly, getter=isKeyboardVisible) BOOL keyboardVisible;

@property (nonatomic, readonly) CGRect keyboardFrame;

- (void)addObserver:(id<XTKeyboardObserver>)observer;

- (void)removeObserver:(id<XTKeyboardObserver>)observer;

- (CGRect)convertRect:(CGRect)rect toView:(nullable UIView *)view;

@end


