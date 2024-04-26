package com.fasterimage

import android.graphics.Color
import android.webkit.URLUtil
import com.bumptech.glide.Glide
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap

class FastImageViewImpl(themedReactContext: ReactApplicationContext) {
  private val reactContext:ReactApplicationContext = themedReactContext;

  public fun setSource(view: FasterImageView, value: ReadableMap) {
    val imageUrl: String? = value.getString("uri")
    if(URLUtil.isValidUrl(imageUrl)) {
      Glide.with(reactContext)
        .load(imageUrl)
        .centerCrop()
        .into(view)
    }
    else {
      val pathUrl: String = "@drawable/$imageUrl"
      val packageName = reactContext.packageName;
      val imageResource = reactContext.resources.getIdentifier(pathUrl, null, packageName)
      view.setImageResource(imageResource)
    }
  }

  public fun setTintColor(view: FasterImageView, value: String) {
      view.setColorFilter(Color.parseColor(value))
  }

  public fun setRadius(view: FasterImageView, value: Float) {
    val radius: Float = value * reactContext.resources.displayMetrics.scaledDensity
   val shapeAppearanceModel = view.shapeAppearanceModel.toBuilder().setAllCornerSizes(radius).build()
    view.shapeAppearanceModel = shapeAppearanceModel
  }

  companion object {
    const val NAME = "LegacyFasterImageView"
    const val FABRICNAME = "FasterImageView"
  }
}
