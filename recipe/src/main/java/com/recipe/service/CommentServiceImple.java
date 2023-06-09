package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.CommentMapper;

@Service
public class CommentServiceImple implements CommentService {
	
	@Autowired
	CommentMapper commentmapper;
	
	
}
