package com.fasterimage;

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp



@ReactModule(name = FastImageViewImpl.FABRICNAME)
class FasterImageViewManager(private val reactApplicationContext: ReactApplicationContext): SimpleViewManager<FasterImageView>() {
  private val fastImageViewImpl = FastImageViewImpl(reactApplicationContext)
  override fun getName(): String {
    return FastImageViewImpl.FABRICNAME
  }

  override fun createViewInstance(p0: ThemedReactContext): FasterImageView {
   return FasterImageView(p0)
  }

  @ReactProp(name="source")
  fun setSource(view: FasterImageView?, value: ReadableMap?) {
    if(value != null && view != null) {
      fastImageViewImpl.setSource(view, value)
    }
  }
  @ReactProp(name="radius")
   fun setRadius(view: FasterImageView?, value: Float) {
    if(view != null) {
      fastImageViewImpl.setRadius(view, value)
    }
  }

  override fun onAfterUpdateTransaction(view: FasterImageView) {
    super.onAfterUpdateTransaction(view)
     fastImageViewImpl.renderImage(view)
  }
}
