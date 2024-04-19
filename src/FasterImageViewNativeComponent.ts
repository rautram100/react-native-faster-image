import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type { Float } from 'react-native/Libraries/Types/CodegenTypes';

type headersType = {
  Authorization: string;
};

type SourceProps = {
  uri: string;
  headers?: headersType;
};

interface NativeProps extends ViewProps {
  color?: string;
  source?: SourceProps;
  radius?: Float;
  tintColor?: string;
}

export default codegenNativeComponent<NativeProps>('FasterImageView');