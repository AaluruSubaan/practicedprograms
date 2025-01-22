package com.example.photosapi.api

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {
    private const val BASE_URL = "https://jsonplaceholder.typicode.com/"

    val apiService: ApiService by lazy {
        Retrofit.Builder() //builder
            .baseUrl(BASE_URL)//baseUrl
            .addConverterFactory(GsonConverterFactory.create()) //handle response
            .build() // build the Servie
            .create(ApiService::class.java) // for which interface ApiService
    }
}