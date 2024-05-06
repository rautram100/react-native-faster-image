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
    BOOL isBase64 = [[json objectForKey:@"isBase64"] boolValue];
    BOOL isGIF = [[json objectForKey:@"isGIF"] boolValue];
    NSString *tintColor = json[@"tintColor"];
    NSString *resizeMode = json[@"resizeMode"];
    if(isBase64 || isGIF) {
       [view sd_setImageWithURL: url];
   }
    else if((url && [url scheme] && [url host])) {
        if(tintColor == nil) {
            [view sd_setImageWithURL: url];
        }
        else {
            [view sd_setImageWithURL: url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                UIColor *color = [Utils hexStringToColor: tintColor];
                UIImage *newImage = [Utils getImageWithTintColor:image :color];
                view.image = newImage;
            }];
        }
        if(resizeMode != nil) {
            view.contentMode = [Utils getUIImageContentMode: resizeMode];
        }
    }
    else {
        if(tintColor == nil) {
            view.image = [UIImage imageNamed: stringURL];
        }
        else {
            UIImage *image = [UIImage imageNamed: stringURL];
            UIColor *color = [Utils hexStringToColor: tintColor];
            UIImage *newImage = [Utils getImageWithTintColor:image :color];
            view.image = newImage;
        }
    }
    
}


RCT_CUSTOM_VIEW_PROPERTY(radius, NSCFNumber, UIImageView) {
    NSNumber *myNumber = json;
    double value = fabs(myNumber.doubleValue);
    view.layer.cornerRadius = value;
}

@end
