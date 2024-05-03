#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "Utils.h"

@interface FasterImageViewManager : RCTViewManager
@end

@implementation FasterImageViewManager

RCT_EXPORT_MODULE(FasterImageView)


RCT_EXPORT_VIEW_PROPERTY(source, NSObject)
RCT_EXPORT_VIEW_PROPERTY(radius, NSFloat)
RCT_EXPORT_VIEW_PROPERTY(tintColor, NSString)
RCT_EXPORT_VIEW_PROPERTY(resizeMode, NSString)
@end
