//
//  SvgManager.h
//  peermentor_app4
//
//  Created by Senior Consultant on 18/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//


#if __has_include(<React/RCTViewManager.h>)
#import <React/RCTViewManager.h>
#elif __has_include("RCTViewManager.h")
#import "RCTViewManager.h"
#else
#import "React/RCTViewManager.h"
#endif

@interface ISvgImageManager : RCTViewManager
@end

