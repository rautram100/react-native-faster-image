// export { default as FasterImageView } from './FasterImageViewNativeComponent';
// export * from './FasterImageViewNativeComponent';
import * as React from 'react';
import { requireNativeComponent, type ViewProps } from 'react-native';

// const LegacyFasterImageView = requireNativeComponent('LegacyFasterImageView');

const isFabricEnabled: boolean = global.nativeFabricUIManager != null;

export type headersType = {
  Authorization: string;
};

export type SourceProps = {
  uri: string;
  headers?: headersType;
  isBase64?: boolean;
  isGIF?: boolean;
  tintColor?: string;
  resizeMode?: ResizeMode;
};

export type ResizeMode = 'contain' | 'cover' | 'stretch' | 'center';

export interface FasterImageProps extends ViewProps {
  source: SourceProps;
  radius?: number;
}

const ImageView = isFabricEnabled
  ? require('./FasterImageViewNativeComponent').default
  : requireNativeComponent<FasterImageProps>('LegacyFasterImageView');

export class FasterImageView extends React.Component<FasterImageProps> {
  constructor(props: FasterImageProps) {
    super(props);
  }
  render(): React.ReactNode {
    return <ImageView {...this.props} />;
  }
}
