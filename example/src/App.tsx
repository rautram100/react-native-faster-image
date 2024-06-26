import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';
import type {
  onLoadEndEvent,
  onProgressEvent,
} from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        source={{
          uri: 'https://i.ytimg.com/vi_webp/7vNERr6yBXE/maxresdefault.webp',
        }}
        style={styles.image}
        onProgress={(evt: onProgressEvent) => {
          console.log('the event', evt.nativeEvent);
        }}
        onLoadEnd={(evt: onLoadEndEvent) => {
          console.log('the event is ', evt.nativeEvent);
        }}
        onError={() => {
          console.log('error while fetching the image');
        }}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  image: {
    width: 400,
    height: 200,
  },
  left: {
    height: 50,
    width: 50,
  },
  image2: {
    height: 150,
    width: 300,
  },
});
