#ifdef RCT_NEW_ARCH_ENABLED
#import "FasterImageView.h"

#import <react/renderer/components/RNFasterImageViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNFasterImageViewSpec/EventEmitters.h>
#import <react/renderer/components/RNFasterImageViewSpec/Props.h>
#import <react/renderer/components/RNFasterImageViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "Utils.h"

using namespace facebook::react;

@interface FasterImageView () <RCTFasterImageViewViewProtocol>

@end

@implementation FasterImageView {
    UIView * _view;
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

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<FasterImageViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<FasterImageViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setBackgroundColor: [Utils hexStringToColor:colorToConvert]];
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> FasterImageViewCls(void)
{
    return FasterImageView.class;
}

@end
#endif
