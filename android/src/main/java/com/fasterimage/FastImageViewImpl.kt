package com.fasterimage

import android.graphics.Color
import android.util.Base64
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
    requestManager = Glide.with(reactContext)
    view.adjustViewBounds = true
    if(URLUtil.isValidUrl(imageUrl)) {
      val isGIF: Boolean = value.getBoolean("isGIF")
       if(isGIF) {
        requestManager
          .asGif()
          .load(imageUrl)
          .into(view)
      }
      else {
         requestManager
           .load(imageUrl)
           .into(view)
       }
    }
    else {
      val isBase64: Boolean = value.getBoolean("isBase64")
      if(isBase64) {
        requestManager
          .asBitmap()
          .load(Base64.decode(imageUrl, Base64.DEFAULT))
          .into(view)
      }
      else {
        val pathUrl: String = "@drawable/$imageUrl"
        val packageName = reactContext.packageName;
        val imageResource = reactContext.resources.getIdentifier(pathUrl, null, packageName)
        view.setImageResource(imageResource)
      }
    }
    val tintColor: String? = value.getString("tintColor")
    if(tintColor != null) {
      view.setColorFilter(Color.parseColor(tintColor))
    }
    else {
      view.clearColorFilter()
    }
    val resizeMode: String? = value.getString("resizeMode")
    if(resizeMode != null) {
      when (resizeMode) {
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
    else {
      view.scaleType = ImageView.ScaleType.CENTER_CROP
    }
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
