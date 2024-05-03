import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.image} />
      <FasterImageView
        source={{
          uri: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBNXZmD93vvtMUrq4J8Ahrxi0lpGXN1kUrTyGdm7wmqw&s',
        }}
        style={styles.image}
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
  image: {
    width: 200,
    height: 150,
    backgroundColor: 'tomato',
  },
});
