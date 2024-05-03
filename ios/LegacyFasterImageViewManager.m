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
    BOOL isBase64 = json[@"isBase64"];
    if((url && [url scheme] && [url host]) || isBase64) {
        [view sd_setImageWithURL: url];
    }
    else {
        view.image = [[UIImage imageNamed: stringURL] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    }
    view.contentMode = UIViewContentModeScaleToFill;
    
}

RCT_CUSTOM_VIEW_PROPERTY(tintColor, NSString, UIImageView) {
    [view setTintColor: [Utils hexStringToColor: json]];
}

RCT_CUSTOM_VIEW_PROPERTY(radius, NSCFNumber, UIImageView) {
    NSNumber *myNumber = json;
    double value = fabs(myNumber.doubleValue);
    view.layer.cornerRadius = value;
}

RCT_CUSTOM_VIEW_PROPERTY(resizeMode, NSString, UIImageView) {
    if([json isEqualToString: @"contain"]) {
        view.contentMode = UIViewContentModeScaleAspectFill;
    }
    else if([json isEqualToString: @"stretch"]) {
        view.contentMode = UIViewContentModeScaleAspectFit;
    }
    else if([json isEqualToString: @"center"]) {
        view.contentMode = UIViewContentModeCenter;
    }
    else {
        view.contentMode = UIViewContentModeScaleToFill;
    }
}

@end
