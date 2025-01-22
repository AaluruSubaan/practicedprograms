package com.example.social.api

import com.example.social.model.User
import retrofit2.Call
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Path

const val BaseUrl="https://jsonplaceholder.typicode.com/"

interface ApiService {
    @GET("users")
    fun getUsers(): Call<List<User>>

    @GET("users/{userId}")
    fun getUser(@Path("userId") userId: Int): Call<User>

    object ApiClient {
        private const val BASE_URL = "https://jsonplaceholder.typicode.com/"

        val apiService: ApiService by lazy {
            Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(ApiService::class.java)
        }
    }
}
