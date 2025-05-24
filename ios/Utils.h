//
//  Utils.h
//  FasterImage
//
//  Created by Aerion Technologies on 24/05/2025.
//

#ifndef Utils_h
#define Utils_h

@interface Utils : NSObject
+ hexStringToColor:(NSString *)stringToConvert;
+ (UIImage*)getImageWithTintColor: (UIImage*)imageView : (UIColor*) tintColor;
+ (UIViewContentMode)getUIImageContentMode : (NSString*) contentMode;
@end

#endif /* Utils_h */
