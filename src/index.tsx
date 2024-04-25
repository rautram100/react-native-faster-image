// export { default as FasterImageView } from './FasterImageViewNativeComponent';
// export * from './FasterImageViewNativeComponent';
import * as React from 'react';
import { requireNativeComponent, type ViewProps } from 'react-native';

// const LegacyFasterImageView = requireNativeComponent('LegacyFasterImageView');

const isFabricEnabled: boolean = global.nativeFabricUIManager != null;

type SourceProps = {
  uri: string;
};

interface ImageProps extends ViewProps {
  source: SourceProps;
  tintColor?: string;
  radius?: number;
}

const ImageView = isFabricEnabled
  ? require('./FasterImageViewNativeComponent').default
  : requireNativeComponent<ImageProps>('LegacyFasterImageView');

export const FasterImageView: React.FC<ImageProps> = (props) => {
  return <ImageView {...props} />;
};
