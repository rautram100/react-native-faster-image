// export { default as FasterImageView } from './FasterImageViewNativeComponent';
// export * from './FasterImageViewNativeComponent';
import * as React from 'react';
import { requireNativeComponent, type ViewProps } from 'react-native';

// const LegacyFasterImageView = requireNativeComponent('LegacyFasterImageView');

const isFabricEnabled: boolean = global.nativeFabricUIManager != null;

type headersType = {
  Authorization: string;
};

type SourceProps = {
  uri: string;
  headers?: headersType;
  isBase64?: boolean;
  isGIF?: boolean;
};

export type ResizeMode = 'contain' | 'cover' | 'stretch' | 'center';

interface ImageProps extends ViewProps {
  source: SourceProps;
  tintColor?: string;
  radius?: number;
  resizeMode?: ResizeMode;
}

const ImageView = isFabricEnabled
  ? require('./FasterImageViewNativeComponent').default
  : requireNativeComponent<ImageProps>('LegacyFasterImageView');

export const FasterImageView: React.FC<ImageProps> = (props) => {
  const { source } = props;
  source.isGIF = source.isGIF || false;
  if (source.isBase64 !== undefined && source.isBase64) {
    let { uri } = source;
    uri = `data:image/png;base64,${uri}`;
    source.uri = uri;
  } else {
    source.isBase64 = false;
  }
  props.source = source;

  return <ImageView {...props} />;
};
