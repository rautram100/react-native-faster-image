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
        resizeMode="contain"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
    backgroundColor: 'tomato',
  },
  image: {
    width: 200,
    height: 150,
  },
  image2: {
    height: 200,
    width: 400,
  },
});
