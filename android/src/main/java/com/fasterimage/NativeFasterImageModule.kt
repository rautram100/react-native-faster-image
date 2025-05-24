package com.fasterimage
import com.bumptech.glide.Glide
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableArray
import com.facebook.react.bridge.ReadableType


class NativeFasterImageModule(reactContext: ReactApplicationContext): NativeFasterImageSpec(reactContext) {

  override fun getName() = NAME
  override fun preload(images: ReadableArray?) {
      if(images != null) {
        for(i in 0 until images.size()) {
          Glide.with(reactApplicationContext)
            .load(images.getString(i))
            .preload()
        }
      }
  }

  companion object {
    const val NAME = "NativeFasterImage"
  }
}
