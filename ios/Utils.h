#ifndef Utils_h
#define Utils_h

@interface Utils : NSObject
+ hexStringToColor:(NSString *)stringToConvert;
+ (UIImage*)getImageWithTintColor: (UIImage*)imageView : (UIColor*) tintColor;
+ (UIViewContentMode)getUIImageContentMode : (NSString*) contentMode;
@end

#endif /* Utils_h */
