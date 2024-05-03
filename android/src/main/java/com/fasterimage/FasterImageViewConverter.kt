package com.fasterimage

import android.widget.ImageView


class FasterImageViewConverter {
  companion object {
    private val FASTER_IMAGE_RESIZE_MODE_MAP: Map<String, ImageView.ScaleType> = hashMapOf("contain" to ImageView.ScaleType.FIT_CENTER, "cover" to ImageView.ScaleType.CENTER_CROP, "stretch" to ImageView.ScaleType.FIT_XY, "center" to ImageView.ScaleType.CENTER_INSIDE)
    fun getScaleType(type: String) : ImageView.ScaleType? = FASTER_IMAGE_RESIZE_MODE_MAP[type]
  }
}
