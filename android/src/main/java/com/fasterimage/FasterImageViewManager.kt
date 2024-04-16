package com.fasterimage

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = FasterImageViewManager.NAME)
class FasterImageViewManager :
  FasterImageViewManagerSpec<FasterImageView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): FasterImageView {
    return FasterImageView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: FasterImageView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "FasterImageView"
  }
}
