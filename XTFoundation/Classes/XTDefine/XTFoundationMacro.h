//
//  XTFoundationMacro.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#ifndef XTFoundationMacro_h
#define XTFoundationMacro_h

//给所有扩展加上这个，就不用添加-all_load 或者 -force_load。
#ifndef XTSYNTH_DUMMY_CLASS
#define XTSYNTH_DUMMY_CLASS(_name_) \
@interface XTSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation XTSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif


#endif /* XTFoundationMacro_h */
