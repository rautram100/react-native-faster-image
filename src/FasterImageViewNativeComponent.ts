import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type { Float } from 'react-native/Libraries/Types/CodegenTypes';

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
}

export default codegenNativeComponent<NativeProps>('FasterImageView');
