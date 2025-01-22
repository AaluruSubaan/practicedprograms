package com.example.photosapi.api
import com.example.photosapi.model.Photo
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface ApiService {
    @GET("photos")
    fun getPhotosByAlbumId(@Query("albumId")albumId:Int):Call<List<Photo>>
}