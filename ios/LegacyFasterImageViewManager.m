//
//  LegacyFasterImageViewManager.m
//  react-native-faster-image
//
//  Created by Ram Raut on 19/04/2024.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import <SDWebImage/SDWebImage.h>
#import "Utils.h"



@interface LegacyFasterImageViewManager : RCTViewManager

@end

@implementation LegacyFasterImageViewManager

RCT_EXPORT_MODULE(LegacyFasterImageView)

- (UIView *)view {
    return [[UIImageView alloc] init];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}



RCT_CUSTOM_VIEW_PROPERTY(source, NSDictionary, UIImageView) {
    view.clipsToBounds = YES;
    view.layer.masksToBounds = YES;
    NSString *stringURL = json[@"uri"];
    NSURL *url = [NSURL URLWithString: stringURL];
    if(url && [url scheme] && [url host]) {
        [view sd_setImageWithURL: url];
    }
    else {
        view.image = [[UIImage imageNamed: stringURL] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(tintColor, NSString, UIImageView) {
    [view setTintColor: [Utils hexStringToColor: json]];
}

RCT_CUSTOM_VIEW_PROPERTY(radius, NSCFNumber, UIImageView) {
    NSNumber *myNumber = json;
    double value = fabs(myNumber.doubleValue);
    view.layer.cornerRadius = value;
}

@end
