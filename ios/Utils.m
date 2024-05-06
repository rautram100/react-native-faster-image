#import <Foundation/Foundation.h>
#import "Utils.h"
#import <UIKit/UIKit.h>

@implementation Utils

+ hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];
    
    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

+ (UIImage*)getImageWithTintColor: (UIImage*)imageView : (UIColor*) tintColor
{
    UIImage *newImage = [imageView imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    UIGraphicsImageRenderer *renderer = [[UIGraphicsImageRenderer alloc] initWithSize: imageView.size];
    newImage = [renderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        [tintColor setFill];
        [newImage drawInRect:CGRectMake(0, 0, imageView.size.width, newImage.size.height)];
    }];
    return newImage;
}

+ (UIViewContentMode)getUIImageContentMode : (NSString*) contentMode
{
    if([contentMode isEqualToString: @"contain"]) {
        return  UIViewContentModeScaleAspectFit;
    }
    else if([contentMode isEqualToString: @"stretch"]) {
        return UIViewContentModeScaleToFill;
    }
    else if([contentMode isEqualToString: @"center"]) {
        return UIViewContentModeCenter;
    }
    else {
        return UIViewContentModeScaleAspectFill;
    }
}


+ (id)alloc {
  [NSException raise:@"Cannot be instantiated!" format:@"Static class 'Utils' cannot be instantiated!"];
  return nil;
}

@end
