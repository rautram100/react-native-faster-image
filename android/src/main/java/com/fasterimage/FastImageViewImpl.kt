package com.fasterimage


import android.graphics.Color
import android.util.Base64
import android.webkit.URLUtil
import android.widget.ImageView
import com.bumptech.glide.Glide
import com.bumptech.glide.RequestManager
import com.bumptech.glide.load.resource.bitmap.CenterInside
import com.bumptech.glide.load.resource.bitmap.RoundedCorners
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableMap


class FastImageViewImpl(themedReactContext: ReactApplicationContext) {
  private val reactContext:ReactApplicationContext = themedReactContext;
  private val requestManager: RequestManager = Glide.with(themedReactContext)
  private lateinit var source: ReadableMap
  private var radius: Float? = null

  public fun setSource(view: FasterImageView, value: ReadableMap) {
    source = value
  }


  public fun setRadius(view: FasterImageView, value: Float) {
    radius = value
  }

  public fun renderImage(view: FasterImageView) {
    view.adjustViewBounds = true
    val r = (radius?.times(reactContext.resources.displayMetrics.scaledDensity)) ?: 1
    val imageUrl: String? = source.getString("uri")
    val isGif: Boolean = source.getBoolean("isGIF")
    val isBase64 = source.getBoolean("isBase64")
    val tintColor: String? = source.getString("tintColor")
    val resizeMode: String? = source.getString("resizeMode")
    if(URLUtil.isValidUrl(imageUrl)) {
      if (isGif) {
        requestManager
          .asGif()
          .load(imageUrl)
          .transform(CenterInside(), RoundedCorners(r.toInt()))
          .into(view)
      }
      else {
        requestManager
          .load(imageUrl)
          .transform(CenterInside(), RoundedCorners(r.toInt()))
          .into(view)
      }
    }
    else if(isBase64) {
      requestManager
        .asBitmap()
        .load(Base64.decode(imageUrl, Base64.DEFAULT))
        .transform(CenterInside(), RoundedCorners(r.toInt()))
        .into(view)
    }
    else {
      val pathUrl: String = "@drawable/$imageUrl"
      val packageName = reactContext.packageName;
      val imageResource = reactContext.resources.getIdentifier(pathUrl, null, packageName)
      view.setImageResource(imageResource)
    }
    if(tintColor != null) {
      view.setColorFilter(Color.parseColor(tintColor))
    }
    else {
      view.clearColorFilter()
    }
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
      view.scaleType = ImageView.ScaleType.FIT_CENTER
    }

  }


  companion object {
    const val NAME = "LegacyFasterImageView"
    const val FABRICNAME = "FasterImageView"
  }
}
