package com.springmvc.mock.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.mock.models.Movie;
import com.springmvc.mock.repositories.MovieRepository;

@Service
public class AdminMovieService {
	
	@Autowired
	private MovieRepository movieRepository;
	
	public List<Movie> getAllMovie(){
		return movieRepository.findAll();
	}
	
	public Movie getMovieById(Long id) {
		return movieRepository.findById(id).orElse(null);
	}
	
	public void saveMovie(Movie movie) {
		movieRepository.save(movie);
	}
	
	public void delMovie(Long id) {
		movieRepository.deleteById(id);
	}
}
