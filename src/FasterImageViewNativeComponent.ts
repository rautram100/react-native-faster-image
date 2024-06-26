import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  DirectEventHandler,
  Float,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';

type headersType = {
  Authorization: string;
};

type SourceProps = {
  uri: string;
  headers?: headersType;
  isBase64?: boolean;
  isGIF?: boolean;
  tintColor?: string;
  resizeMode?: string;
};

interface NativeProps extends ViewProps {
  source?: SourceProps;
  radius?: Float;
  onLoadStart?: DirectEventHandler<{}>;
  onLoadEnd?: DirectEventHandler<
    Readonly<{
      height: Float;
      width: Float;
    }>
  >;
  onError?: DirectEventHandler<{}>;
  onProgress?: DirectEventHandler<
    Readonly<{
      bytesWritten: Int32;
      bytesExpected: Int32;
    }>
  >;
}

export default codegenNativeComponent<NativeProps>('FasterImageView');
