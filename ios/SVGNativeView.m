//t-machine.org/index.php/2012/12/31/svgkit-2013-usage/
//
//  SVGNativeView.m
//  peermentor_app4
//
//  Created by Senior Consultant on 19/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVGKit.h"
#import "SVGKImage.h"

#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include("RCTEventDispatcher.h")
#import "RCTEventDispatcher.h"
#else
#import "React/RCTEventDispatcher.h"
#endif

#define QUOTE(...) #__VA_ARGS__ 

@implementation SVGNativeView : UIImageView {
    RCTEventDispatcher *_eventDispatcher;
    SVGKImage *_childView;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if((self == [super init])){
        _eventDispatcher = eventDispatcher;
        
        NSString* longURL = [NSString stringWithFormat:@"%@%@%@",
                             @"http://upload.wikimedia.org/",
                             @"wikipedia/commons/f/fd/",
                             @"Ghostscript_Tiger.svg"];
        NSURL* url = [NSURL URLWithString:longURL];
        _childView = [SVGKImage imageWithContentsOfURL:url];
        
        
        
    }
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.image = _childView.UIImage;
}
@end

