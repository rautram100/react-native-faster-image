package com.fasterimage

import android.content.Context
import android.graphics.Color
import android.util.AttributeSet
import android.util.Base64
import android.webkit.URLUtil
import android.widget.ImageView
import android.widget.LinearLayout
import com.bumptech.glide.Glide
import com.bumptech.glide.RequestManager
import com.facebook.react.bridge.ReadableMap
import com.google.android.material.imageview.ShapeableImageView


class FasterImageView : LinearLayout {
  private lateinit var view: ShapeableImageView
  private lateinit var requestManager: RequestManager
  constructor(context: Context) : super(context) {
    configureComponent()
  }

  private fun configureComponent() {
    inflate(context, R.layout.faster_image_view, this)
    view = findViewById(R.id.shapeableImageView)
    requestManager = Glide.with(context)
  }

  constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
    configureComponent()
  }

  constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
    configureComponent()
  }

  public fun setSource(value: ReadableMap) {
    val imageUrl: String? = value.getString("uri")
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
        val packageName = context.packageName;
        val imageResource = context.resources.getIdentifier(pathUrl, null, packageName)
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
      view.scaleType = ImageView.ScaleType.FIT_CENTER
    }
  }


  public fun setRadius(value: Float) {
    val radius: Float = value * context.resources.displayMetrics.scaledDensity
    val shapeAppearanceModel = view.shapeAppearanceModel.toBuilder().setAllCornerSizes(radius).build()
    view.shapeAppearanceModel = shapeAppearanceModel
  }
}
