import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { FasterImageView } from '@rraut/react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        source={{
          uri: 'https://i.ytimg.com/vi_webp/7vNERr6yBXE/maxresdefault.webp',
        }}
        style={styles.image}
        onProgress={(evt) => {
          console.log('the event', evt.nativeEvent);
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
