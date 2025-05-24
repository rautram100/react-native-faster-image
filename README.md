# react-native-faster-image

FasterImageView is a wrapper around [SDWebImage](https://github.com/SDWebImage/SDWebImage) and [Glide](https://github.com/bumptech/glide) for efficient image rendering and caching purposes. It supports both old and new React Native architecture.

## Motivation

We already have [react-native-fast-image](https://github.com/DylanVann/react-native-fast-image) package for exactly the same reason but since the project seems to have been abandoned, I have been facing some issues with this library. Knowing that this library will not get any new updates, Me with my some friends started to build this package with the plan to support both the New and old architecture. This release just have bare minimum features with the first release only supports the uri, tintColor, borderRadius and compiled images. We have further plan to support webP, gif, image with headers, caching strategy and many more.

## Note: Starting from version 1.0.0 old architecture support has been dropped. Please use vesrion 0.1.4 if you need old architecture support

## Installation

```sh
yarn add @rraut/react-native-faster-image
cd ios && pod install

```

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

## GIF Support

You have pass isGIF parameter inside source props to render the GIF Image

```js
import { FasterImageView } from '@rraut/react-native-faster-image';

// ...

<FasterImageView
  source={{
    uri: 'https://www.adorama.com/alc/wp-content/uploads/2021/05/bird-wings-flying.gif',
    isGIF: true,
  }}
  style={styles.image}
/>;
```

## Base64 Image format support

Just as on GIF you have to pass isBase64 parameter inside the source url to render the image of base64 format.

```js
import { FasterImageView } from '@rraut/react-native-faster-image';

// ...

<FasterImageView
  source={{
    uri: 'iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAIAAADTED8xAAADMElEQVR4nOzVwQnAIBQFQYXff81RUkQCOyDj1YOPnbXWPmeTRef+/3O/OyBjzh3CD95BfqICMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMO0TAAD//2Anhf4QtqobAAAAAElFTkSuQmCC',
    isBase64: true,
  }}
  style={styles.image}
/>;
```

## Image Resize Mode

Same as the default Image component, FasterImageView supports "contain", "cover", "stretch", "center" as the image resize Mode

```js
import { FasterImageView } from '@rraut/react-native-faster-image';

// ...

<FasterImageView
  source={{
    uri: 'https://lh3.googleusercontent.com/hwau7OVWx96XaME5KpRuJ0I_MscrerK6SbRH1UwYHYaxIDQQtn7RZK02LDSfBzCreidFgDsJeXyqDct6EZiH6vsV=w640-h400-e365-rj-sc0x00ffffff',
    resizeMode: 'contain',
  }}
  style={styles.image}
/>;
```

## Why radius props ?

react-native-faster-image directly exposes the platform specific ImageView rather than the ImageView wrapped inside the UIView. Because of this borderRadius style applied on the ImageView will not work and you have to pass extra radius props. The radius props will apply border radius to all four corners of the image and this library currently doesn't support border radius for indivisual corners for now. This will soon change as we are working on this feature.

## Features

- [x] Aggressively cache images.
- [x] Border Radius
- [x] GIF support
- [x] Base64 Image format suuport
- [ ] Add authorization headers.
- [ ] Prioritize images.
- [ ] Image Load/Error/Completed Events
- [ ] Bridgeless Mode Support
- [x] Preload images.
- [ ] Animated Image Transition while image loading
- [ ] BlurHash Support

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
