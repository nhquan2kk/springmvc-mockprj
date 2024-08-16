package com.springmvc.mock.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.mock.models.Movie;
import com.springmvc.mock.services.AdminMovieService;

@Controller
@RequestMapping("/movie")
public class AdminMovieController {
	
	@Autowired
	private AdminMovieService adminMovieService;
	
	@GetMapping("/listmovie")
	public String listMovie(Model model) {
		List<Movie> movies = adminMovieService.getAllMovie();
		model.addAttribute("movies", movies);
		return "listMovie";
	}
	
	@GetMapping("/createmovieform")
	public String showCreateForm() {
		return "adminCreateMovie";
	}
	
	@PostMapping("/createmovie")
	public String createMovie(
			@ModelAttribute Movie movie
			) {
		adminMovieService.saveMovie(movie);
		return "redirect:/movie/listmovie";
	}
	
	@PostMapping("/updatemovie")
	public String updateMovie(
			@RequestParam("id") Long id,
			@RequestParam("title") String title,
			@RequestParam("genre") String genre,
			@RequestParam("description") String description,
			@RequestParam("duration") Long duration
			) {
		Movie movie = adminMovieService.getMovieById(id);
		if(movie != null) {
		movie.setTitle(title);
		movie.setGenre(genre);
		movie.setDescription(description);
		movie.setDuration(duration);
		adminMovieService.saveMovie(movie);
	}
		return "redirect:/movie/listmovie";
	}
	
	@PostMapping("/delmovie")
	public String delMovie(@RequestParam("id") Long id) {
		adminMovieService.delMovie(id);
		return "redirect:/movie/listmovie";
	}
}
