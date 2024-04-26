import * as React from 'react';

import { StyleSheet, Text, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        source={{
          uri: 'https://lh3.googleusercontent.com/hwau7OVWx96XaME5KpRuJ0I_MscrerK6SbRH1UwYHYaxIDQQtn7RZK02LDSfBzCreidFgDsJeXyqDct6EZiH6vsV=w640-h400-e365-rj-sc0x00ffffff',
        }}
        style={styles.image}
        radius={100}
      />

      <Text>Hello</Text>
      <FasterImageView
        source={{
          uri: 'funnel',
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
    backgroundColor: 'tomato',
  },
  image: {
    height: 200,
    width: 200,
    backgroundColor: 'tomato',
  },
  image2: {
    height: 200,
    width: 200,
  },
});
