import NativeFasterImage from './NativeFasterImage';
import * as React from 'react';
import { type ViewProps } from 'react-native';

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

export interface onLoadEndEvent {
  nativeEvent: {
    width: number;
    height: number;
  };
}

export interface onProgressEvent {
  nativeEvent: {
    bytesWritten: number;
    bytesExpected: number;
  };
}

export interface FasterImageProps extends ViewProps {
  source: SourceProps;
  radius?: number;
  onProgress?: (event: onProgressEvent) => void;
  onLoadEnd?: (event: onLoadEndEvent) => void;
  onError?: () => void;
}

const ImageView = require('./FasterImageViewNativeComponent').default;

export class FasterImageView extends React.Component<FasterImageProps> {
  constructor(props: FasterImageProps) {
    super(props);
  }
  render(): React.ReactNode {
    const newProps = { ...this.props };
    /** This change is required as Codegen C++ to Objective C++ bool data type mapping  gets mismateched to bool and string..
     * Needs to look at this on depth to simplify the JS api.
     *
     */
    if (newProps.source.isGIF === undefined) {
      newProps.source.isGIF = false;
    }
    if (newProps.source.isBase64 === undefined) {
      newProps.source.isBase64 = false;
    }
    return <ImageView {...newProps} />;
  }
}

export const FasterImage = NativeFasterImage;
