# react-native-faster-image

FasterImageView is a wrapper around [SDWebImage](https://github.com/SDWebImage/SDWebImage) and [Glide](https://github.com/bumptech/glide) for efficient image rendering and caching purposes. It supports both old and new React Native architecture. 

## Motivation
We already have [react-native-fast-image](https://github.com/DylanVann/react-native-fast-image) package for exactly the same reason but since the project seems to have been abandoned, I have been facing some issues with this library. Knowing that this library will not get any new updates, Me with my some friends started to build this package with the plan to support both the New and old architecture. This release just have bare minimum features with the first release only supports the uri, tintColor, borderRadius and compiled images. We have further plan to support webP, gif, image with headers, caching strategy and many more. 

## Installation

````sh
yarn add @rraut/react-native-faster-image
cd ios && pod install

````

## Usage

```js
import { FasterImageView } from '@rraut/react-native-faster-image';

// ...

<FasterImageView
  source={{
    uri: 'https://lh3.googleusercontent.com/hwau7OVWx96XaME5KpRuJ0I_MscrerK6SbRH1UwYHYaxIDQQtn7RZK02LDSfBzCreidFgDsJeXyqDct6EZiH6vsV=w640-h400-e365-rj-sc0x00ffffff',
  }}
  style={styles.image}
  radius={100}
/>;
```

## Features

-   [x] Aggressively cache images.
-   [x] Border Radius
-   [ ] Add authorization headers.
-   [ ] Prioritize images.
-   [ ] Preload images.
-   [ ] GIF support.
-   [ ] Animated Image Transition while image loading
-   [ ] BlurHash Support


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
