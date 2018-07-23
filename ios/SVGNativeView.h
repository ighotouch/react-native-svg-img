#import <UIkit/UIKit.h>

@class RCTEventDispatcher;

@interface SVGNativeView: UIImageView

@property (nonatomic, assign) NSString *src;

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
NS_DESIGNATED_INITIALIZER;

@end

