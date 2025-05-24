
#import "RCTNativeFasterImage.h"
#import <SDWebImage/SDWebImage.h>

@interface RCTNativeFasterImage()
@property (strong, nonatomic) SDWebImageManager *manager;
@end

@implementation RCTNativeFasterImage


+ (NSString *)moduleName
{
  return @"NativeFasterImage";
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params { 
  return std::make_shared<facebook::react::NativeFasterImageSpecJSI>(params);
}

- (void)preload:(nonnull NSArray *)images { 
  NSMutableArray<NSURL *> *urls = [NSMutableArray arrayWithCapacity:images.count];
  for (NSString *urlString in images) {
      NSURL *url = [NSURL URLWithString:urlString];
      if (url) {
          [urls addObject:url];
      }
  }
  [[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:urls
                                                    progress:^(NSUInteger noOfFinishedUrls, NSUInteger noOfTotalUrls) {
      NSLog(@"Prefetched %lu of %lu", (unsigned long)noOfFinishedUrls, (unsigned long)noOfTotalUrls);
  } completed: nil];
}

@end
