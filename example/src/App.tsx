import { FlatList, StyleSheet, View } from 'react-native';
import { FasterImageView } from 'react-native-faster-image';

export default function App() {
  const renderItem = () => {
    return (
      <FasterImageView
        style={styles.image}
        source={{
          resizeMode: 'contain',
          uri: 'https://plus.unsplash.com/premium_photo-1666901328734-3c6eb9b6b979?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
