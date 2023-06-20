package com.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.mapper.NotifyMapper;

@Service
public class NotifyServiceImple {
	
	@Autowired
	NotifyMapper notifymapper;
}
