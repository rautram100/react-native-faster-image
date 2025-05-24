import { Button, StyleSheet, View } from 'react-native';
import { FasterImageView, FasterImage } from 'react-native-faster-image';

export default function App() {
  const preload = () => {
    FasterImage.preload([
      'https://c8.alamy.com/comp/MR0G79/random-pictures-MR0G79.jpg',
      'https://plus.unsplash.com/premium_photo-1666901328734-3c6eb9b6b979?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1583430999204-f9595a23469c?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ]);
  };
  return (
    <View style={styles.container}>
      <FasterImageView
        style={styles.image}
        source={{
          resizeMode: 'contain',
          uri: 'https://plus.unsplash.com/premium_photo-1666901328734-3c6eb9b6b979?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        }}
      />
      <Button title="Preload Images" onPress={preload} />
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
