package com.fasterimage

import android.graphics.Color
import android.webkit.URLUtil
import android.widget.ImageView
import com.bumptech.glide.Glide
import com.bumptech.glide.RequestManager
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap


class FastImageViewImpl(themedReactContext: ReactApplicationContext) {
  private val reactContext:ReactApplicationContext = themedReactContext;
  private lateinit var requestManager: RequestManager

  public fun setSource(view: FasterImageView, value: ReadableMap) {
    val imageUrl: String? = value.getString("uri")
    if(URLUtil.isValidUrl(imageUrl)) {
      view.adjustViewBounds = true
      view.scaleType = ImageView.ScaleType.CENTER_CROP
      requestManager = Glide.with(reactContext)
      requestManager
        .load(imageUrl)
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

  public fun setResizeMode(view: FasterImageView, value: String) {
   when (value) {
     "contain" -> {
       view.scaleType = ImageView.ScaleType.FIT_CENTER
     }
     "stretch" -> {
       view.scaleType = ImageView.ScaleType.FIT_XY
     }
     "center" -> {
       view.scaleType = ImageView.ScaleType.CENTER_INSIDE
     }
     else -> {
       view.scaleType = ImageView.ScaleType.CENTER_CROP
     }
   }
  }

  companion object {
    const val NAME = "LegacyFasterImageView"
    const val FABRICNAME = "FasterImageView"
  }
}
