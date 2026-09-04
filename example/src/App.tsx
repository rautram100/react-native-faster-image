import { FlatList, StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  const renderItem = () => {
    return (
      <FasterImageView
        style={styles.image}
        source={{
          resizeMode: 'contain',
          uri: 'https://www.generatormix.com/images/thumbs/random-image-generator.jpg',
          placeHolder: 'placeholder',
        }}
      />
    );
  };
  return (
    <View style={styles.container}>
      <FlatList
        numColumns={2}
        data={[...Array(500).keys()]}
        renderItem={renderItem}
        keyExtractor={(item) => item.toString()}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
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
