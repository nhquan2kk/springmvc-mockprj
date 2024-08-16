package com.springmvc.mock.services;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.mock.models.User;
import com.springmvc.mock.repositories.UserRepository;

@Service
public class AdminUserService {

	@Autowired
	private UserRepository userRepository;
	
//	private final String uploadDir = new File("src/main/webapp/images/").getAbsolutePath() + "/";
	private final String uploadDir = "src/main/webapp/images/";
	
	public List<User> getAllUser(){
		return userRepository.findAll();
	}
	
	public User getUserById(Long id) {
		return userRepository.findById(id).orElse(null);
	}
	
	public void saveUser(User user, MultipartFile file) throws IOException {
		if(!file.isEmpty()) {
			String filename = UUID.randomUUID().toString() + "_" +file.getOriginalFilename();
			Path path = Paths.get(uploadDir + filename);
			Files.write(path, file.getBytes());
			user.setAvatar(filename);
		}
		userRepository.save(user);
	}
	
	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}
}
