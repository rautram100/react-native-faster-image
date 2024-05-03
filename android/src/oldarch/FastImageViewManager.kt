package com.fasterimage


import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class FasterImageViewManager(private val reactContext: ReactApplicationContext): SimpleViewManager<FasterImageView>() {
  private val fastImageViewImpl = FastImageViewImpl(reactContext)
  override fun getName(): String {
    return FastImageViewImpl.NAME
  }

  override fun createViewInstance(themedReactContext: ThemedReactContext): FasterImageView {
    return FasterImageView(themedReactContext)
  }

  @ReactProp(name="source")
  fun setSource(view: FasterImageView, value: ReadableMap) {
    fastImageViewImpl.setSource(view, value)
  }

  @ReactProp(name="tintColor")
  fun setTintColor(view: FasterImageView, value: String?) {
    if(value != null) {
      fastImageViewImpl.setTintColor(view, value)
    }
  }

  @ReactProp(name="radius")
  fun setRadius(view: FasterImageView, value: Float) {
      fastImageViewImpl.setRadius(view, value)
  }

  @ReactProp(name="resizeMode")
  fun setResizeMode(view: FasterImageView, value: String?) {
    if(value != null) {
      fastImageViewImpl.setResizeMode(view, value)
    }
  }

}
