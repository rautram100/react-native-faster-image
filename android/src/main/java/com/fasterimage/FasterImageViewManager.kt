package com.fasterimage

import android.graphics.Color
import com.bumptech.glide.Glide
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = FasterImageViewManager.NAME)
class FasterImageViewManager :
  FasterImageViewManagerSpec<FasterImageView>() {
    private lateinit var themedReactContext: ThemedReactContext;
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): FasterImageView {
    themedReactContext = context;
    return FasterImageView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: FasterImageView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  @ReactProp(name = "source")
  override fun setSource(view: FasterImageView?, value: ReadableMap?) {
   val imageUrl: String? = value?.getString("uri")
    if(imageUrl != null && view != null) {
      Glide
        .with(themedReactContext)
        .load(imageUrl)
        .centerCrop()
        .into(view)
    }
  }

  @ReactProp(name = "tintColor")
  override fun setTintColor(view: FasterImageView?, value: String?) {
    if(value != null) {
      view?.setColorFilter(Color.parseColor(value))
    }
  }

  @ReactProp(name = "radius")
  override fun setRadius(view: FasterImageView?, value: Float) {
    // Need to decide if bitmap or shapeableImageView will be best for rounded corners.
  }

  companion object {
    const val NAME = "FasterImageView"
  }
}
