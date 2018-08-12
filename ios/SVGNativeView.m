//t-machine.org/index.php/2012/12/31/svgkit-2013-usage/
//
//  SVGNativeView.m
//  peermentor_app4
//
//  Created by Senior Consultant on 19/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVGNativeView.h"
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
        
        NSString* longURL = [NSString stringWithFormat:@"%@",
                             @"<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 64.92201800042366' xmlns:xlink='http://www.w3.org/1999/xlink' version='1.1'><line x1 = '20' y1 = '20' x2 = '200' y2 = '180' stroke = 'black' stroke-width = '3'/></svg>"];
        NSURL* url = [NSURL URLWithString:longURL];
        _childView = [SVGKImage imageWithContentsOfFile:longURL];
        
        
        
    }
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.image = _childView.UIImage;
}

- (void)setSrc:(NSString *)src {
    printf("testing");
    
    NSString* longURL = [NSString stringWithFormat:@"%@",src];
    NSURL* url = [NSURL URLWithString:longURL];
    _childView = [SVGKImage imageWithContentsOfURL:url];
    self.image = _childView.UIImage;
    printf("%s", [src UTF8String]);
}
@end

