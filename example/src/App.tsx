import { StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  return (
    <View style={styles.container}>
      <FasterImageView
        style={styles.image}
        source={{
          uri: 'https://www.generatormix.com/images/thumbs/random-image-generator.jpgssss',
          placeHolder: 'placeholder',
        }}
        radius={20}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  image: {
    width: 200,
    height: 100,
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
