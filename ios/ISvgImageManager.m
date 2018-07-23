//
//  SvgManager.m
//  peermentor_app4
//
//  Created by Senior Consultant on 18/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVGNativeView.h"
#import "ISvgImageManager.h"


#if __has_include(<React/RCTBridge.h>)
#import <React/RCTBridge.h>
#elif __has_include("RCTBridge.h")
#import "RCTBridge.h"
#else
#import "React/RCTBridge.h"
#endif

@implementation ISvgImageManager

@synthesize bridge = _bridge;
RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[SVGNativeView alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

RCT_EXPORT_VIEW_PROPERTY(src, NSString)

@end


