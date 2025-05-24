package com.fasterimage

import android.graphics.Color
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.FasterImageViewManagerInterface
import com.facebook.react.viewmanagers.FasterImageViewManagerDelegate

@ReactModule(name = FasterImageViewManager.NAME)
class FasterImageViewManager : SimpleViewManager<FasterImageView>(),
  FasterImageViewManagerInterface<FasterImageView> {
  private val mDelegate: ViewManagerDelegate<FasterImageView>

  init {
    mDelegate = FasterImageViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<FasterImageView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): FasterImageView {
    return FasterImageView(context)
  }

  companion object {
    const val NAME = "FasterImageView"
  }

  override fun setSource(view: FasterImageView?, value: ReadableMap?) {
    if(view != null && value != null) {
      view.setSource(value)
    }
  }

  override fun setRadius(view: FasterImageView?, value: Float) {
    view?.setRadius(value)
  }
}
