package com.example.movieappwithrelectorandnavigation.fragments

import android.annotation.SuppressLint
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.Recycler
import com.example.movieappwithrelectorandnavigation.R
import com.example.movieappwithrelectorandnavigation.model.MovieResponse
import com.example.movieappwithrelectorandnavigation.api.MovieApiService
import com.example.movieappwithrelectorandnavigation.adapter.MovieAdapter
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MovieListFragment : Fragment() {

    private lateinit var recyclerView: RecyclerView
    private val movieApi=MovieApiService.create()
    @SuppressLint("MissingInflatedId")
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_movie_list, container, false)
        recyclerView = view.findViewById(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(requireContext())
        fetchMovies()
        return view
    }
    private fun fetchMovies() {
        movieApi.getPopularMovies("your_api_key").enqueue(object : Callback<MovieResponse> {
            override fun onResponse(call: Call<MovieResponse>, response: Response<MovieResponse>) {
                if (response.isSuccessful) {
                    val movies = response.body()?.results ?: emptyList()
                    recyclerView.adapter = MovieAdapter(movies) { selectedMovie ->
                        val action = MovieListFragmentDirections
                            .actionMovieListFragmentToMovieDetailFragment(selectedMovie)
                        findNavController().navigate(action)
                    }
                }
            }

            override fun onFailure(call: Call<MovieResponse>, t: Throwable) {
                Toast.makeText(requireContext(), "Failed to fetch movies", Toast.LENGTH_SHORT).show()
            }
        })
    }
}






