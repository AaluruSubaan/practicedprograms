package com.example.photosapi

import android.annotation.SuppressLint
import android.os.Bundle
import android.widget.ImageView
import androidx.activity.enableEdgeToEdge
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response


import com.example.photosapi.adapter.PhotoAdapter
import com.example.photosapi.api.RetrofitClient
import com.example.photosapi.model.Photo
class MainActivity : AppCompatActivity() {

    private lateinit var recyclerView: RecyclerView

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        recyclerView = findViewById(R.id.recyclerview)
        recyclerView.layoutManager = LinearLayoutManager(this)

        fetchPhotos()
    }

    private fun fetchPhotos() {
        val call = RetrofitClient.apiService.getPhotosByAlbumId(1)
        call.enqueue(object : Callback<List<Photo>> {
            override fun onResponse(call: Call<List<Photo>>, response: Response<List<Photo>>) {
                if (response.isSuccessful) {
                    val photos = response.body() ?: emptyList()
                    recyclerView.adapter = PhotoAdapter(photos)
                }
            }

            override fun onFailure(call: Call<List<Photo>>, t: Throwable) {
                t.printStackTrace()
            }
            })
        }
}