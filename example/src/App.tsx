import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        style={styles.image}
        source={{
          uri: 'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
        }}
        radius={100}
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
    width: 200,
    height: 200,
  },
  left: {
    height: 50,
    width: 50,
  },
  image2: {
    height: 300,
    width: 100,
  },
  image3: {
    height: 50,
    width: 50,
  },
});
