package com.fasterimage

import android.view.View

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.FasterImageViewManagerDelegate
import com.facebook.react.viewmanagers.FasterImageViewManagerInterface

abstract class FasterImageViewManagerSpec<T : View> : SimpleViewManager<T>(), FasterImageViewManagerInterface<T> {
  private val mDelegate: ViewManagerDelegate<T>

  init {
    mDelegate = FasterImageViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<T>? {
    return mDelegate
  }
}
