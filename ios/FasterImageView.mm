#ifdef RCT_NEW_ARCH_ENABLED
#import "FasterImageView.h"

#import <react/renderer/components/RNFasterImageViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNFasterImageViewSpec/EventEmitters.h>
#import <react/renderer/components/RNFasterImageViewSpec/Props.h>
#import <react/renderer/components/RNFasterImageViewSpec/RCTComponentViewHelpers.h>
#import <SDWebImage/SDWebImage.h>
#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface FasterImageView () <RCTFasterImageViewViewProtocol>

@end

@implementation FasterImageView {
    SDAnimatedImageView *_imageView;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<FasterImageViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const FasterImageViewProps>();
    _props = defaultProps;
    _imageView = [[SDAnimatedImageView alloc] init];
    _imageView.clipsToBounds = YES;
    _imageView.layer.masksToBounds = YES;
    self.contentView = _imageView;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<FasterImageViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<FasterImageViewProps const>(props);

    if (
        (oldViewProps.source.uri != newViewProps.source.uri) ||
        (oldViewProps.source.tintColor != newViewProps.source.tintColor) ||
        (oldViewProps.source.resizeMode != newViewProps.source.resizeMode) ||
        (oldViewProps.source.isBase64 != newViewProps.source.isBase64)
        ) {
        NSString *stringURL = [[NSString alloc] initWithCString: newViewProps.source.uri.c_str() encoding: NSASCIIStringEncoding];
        NSURL *url = [NSURL URLWithString: stringURL];
        NSString *tintColor = [[NSString alloc] initWithCString: newViewProps.source.tintColor.c_str() encoding: NSASCIIStringEncoding];
        NSString *resizeMode = [[NSString alloc] initWithCString: newViewProps.source.resizeMode.c_str() encoding: NSASCIIStringEncoding];
        Boolean isBase64 = newViewProps.source.isBase64;
         if((url && [url scheme] && [url host])) {
                [_imageView 
                 sd_setImageWithURL: url
                 placeholderImage: nil
                 options: SDWebImageRetryFailed | SDWebImageHandleCookies
                 progress:  ^(NSInteger receivedSize, NSInteger expectedSize, NSURL* _Nullable targetURL) {
                    const auto eventEmitter = [self getEventEmitter];
                    if (eventEmitter) {
                      eventEmitter->onProgress(FasterImageViewEventEmitter::OnProgress{
                          .bytesWritten = static_cast<int>(receivedSize),
                          .bytesExpected = static_cast<int>(expectedSize)
                      });
                    }
                }
                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    const auto eventEmitter = [self getEventEmitter];
                    if(image == nil && eventEmitter) {
                        eventEmitter->onError({});
                    }
                    else {
                        if(eventEmitter) {
                            eventEmitter->onLoadEnd({
                                .width = image.size.width,
                                .height = image.size.height
                            });
                        }
                        if([tintColor length] != 0) {
                            UIColor *color = [Utils hexStringToColor: tintColor];
                            UIImage *newImage = [Utils getImageWithTintColor:image :color];
                            self-> _imageView.image = newImage;
                        }
                    }
                }
                 
                ];
        }
         else if(isBase64) {
             [_imageView sd_setImageWithURL: url];
         }
        else {
            if([tintColor length] == 0) {
                _imageView.image = [UIImage imageNamed: stringURL];
            }
            else {
                UIImage *image = [UIImage imageNamed: stringURL];
                UIColor *color = [Utils hexStringToColor: tintColor];
                UIImage *newImage = [Utils getImageWithTintColor:image :color];
                _imageView.image = newImage;
            }
        }
        
        if([resizeMode length] > 0) {
            _imageView.contentMode = [Utils getUIImageContentMode: resizeMode];
        }
        else {
            _imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
        
    }
    if (oldViewProps.radius != newViewProps.radius) {
        _imageView.layer.cornerRadius = newViewProps.radius;
    }
    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> FasterImageViewCls(void)
{
    return FasterImageView.class;
}

- (std::shared_ptr<const FasterImageViewEventEmitter>)getEventEmitter
{
 if (!self->_eventEmitter) {
   return nullptr;
 }

 assert(std::dynamic_pointer_cast<FasterImageViewEventEmitter const>(self->_eventEmitter));
 return std::static_pointer_cast<FasterImageViewEventEmitter const>(self->_eventEmitter);
}

@end
#endif
