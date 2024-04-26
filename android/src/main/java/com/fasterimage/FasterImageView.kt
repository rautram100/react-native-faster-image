package com.fasterimage

import android.content.Context
import android.util.AttributeSet
import com.google.android.material.imageview.ShapeableImageView


class FasterImageView : ShapeableImageView{
  constructor(context: Context?) : super(context!!)
  constructor(context: Context?, attrs: AttributeSet?) : super(context!!, attrs)
  constructor(context: Context?, attrs: AttributeSet?, defStyleAttr: Int) : super(
    context!!,
    attrs,
    defStyleAttr
  )
}
