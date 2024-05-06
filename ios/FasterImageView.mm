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
    UIImageView *_imageView;
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
    _imageView = [[UIImageView alloc] init];
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
        (oldViewProps.source.isGIF != newViewProps.source.isGIF) ||
        (oldViewProps.source.isBase64 != newViewProps.source.isBase64)
        ) {
        NSString *stringURL = [[NSString alloc] initWithCString: newViewProps.source.uri.c_str() encoding: NSASCIIStringEncoding];
        NSURL *url = [NSURL URLWithString: stringURL];
        NSString *tintColor = [[NSString alloc] initWithCString: newViewProps.source.tintColor.c_str() encoding: NSASCIIStringEncoding];
        NSString *resizeMode = [[NSString alloc] initWithCString: newViewProps.source.resizeMode.c_str() encoding: NSASCIIStringEncoding];
        Boolean isBase64 = newViewProps.source.isBase64;
        Boolean isGIF = newViewProps.source.isGIF;
        if(isBase64 || isGIF) {
            [_imageView sd_setImageWithURL: url];
        }
        else if((url && [url scheme] && [url host])) {
            if([tintColor length] == 0) {
                [_imageView sd_setImageWithURL: url];
            }
            else {
                [_imageView sd_setImageWithURL: url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    UIColor *color = [Utils hexStringToColor: tintColor];
                    UIImage *newImage = [Utils getImageWithTintColor:image :color];
                    self-> _imageView.image = newImage;
                }];
            }
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

@end
#endif
