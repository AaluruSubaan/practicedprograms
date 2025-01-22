package com.example.userappapi.api


import com.example.userappapi.model.Todo
import com.example.userappapi.model.User
import retrofit2.Call
import retrofit2.http.GET

interface ApiService {
    @GET("users")
    fun getUsers(): Call<List<User>>
    @GET("todos")
    fun getTodos(): Call<List<Todo>>
}