package com.example.photosapi.adapter

import android.graphics.BitmapFactory
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.photosapi.R
import com.example.photosapi.model.Photo
import com.bumptech.glide.Glide

class PhotoAdapter(private val photos: List<Photo>) : RecyclerView.Adapter<PhotoAdapter.PhotoViewHolder>() {

    class PhotoViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imageView: ImageView = itemView.findViewById(R.id.photoImage)
        val titleTextView: TextView = itemView.findViewById(R.id.photoTitle)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PhotoViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_photo, parent, false)
        return PhotoViewHolder(view)
    }

    override fun onBindViewHolder(holder: PhotoViewHolder, position: Int) {
        val photo = photos[position]
        holder.titleTextView.text = photo.title

        // Load the image from the URL into the ImageView using Glide
        Glide.with(holder.itemView.context)
            .load(photo.thumbnailUrl)// You can also use photo.url if you prefer the full-size image
            .placeholder(R.drawable.placeholde_image)
            .into(holder.imageView)
    }

    override fun getItemCount()=photos.size


}