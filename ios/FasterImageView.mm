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

    if (oldViewProps.source.uri != newViewProps.source.uri) {
//        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
//        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
        NSString *stringURL = [[NSString alloc] initWithCString: newViewProps.source.uri.c_str() encoding: NSASCIIStringEncoding];
        NSURL *url = [NSURL URLWithString: stringURL];
        if(url && [url scheme] && [url host]) {
            [_imageView sd_setImageWithURL: url];
        }
        else {
            if(oldViewProps.tintColor != newViewProps.tintColor) {
                NSString *colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.tintColor.c_str()];
                _imageView.image = [[UIImage imageNamed: stringURL] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
                [_imageView setTintColor: [Utils hexStringToColor: colorToConvert]];
            }
            else {
                _imageView.image = [UIImage imageNamed: stringURL];
            }
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
