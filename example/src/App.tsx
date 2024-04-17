import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        source={{
          uri: 'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
        }}
        style={styles.image}
        radius={100}
        tintColor="red"
      />

      <FasterImageView
        source={{
          uri: 'filterleft',
        }}
        style={styles.image2}
        tintColor={'#f86b17'}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  image: {
    height: 200,
    width: 200,
  },
  image2: {
    height: 50,
    width: 50,
  },
});
