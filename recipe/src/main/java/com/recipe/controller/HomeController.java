package com.recipe.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recipe.model.BoardVO;
import com.recipe.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	private BoardService boardservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		List<BoardVO> findWriteAll = boardservice.findWriteAll();
		List<BoardVO> findWriteAllGood = boardservice.findWriteAllGood();
		List<BoardVO> findWriteAllView = boardservice.findWriteAllView();
		
		model.addAttribute("findWriteAll",findWriteAll);
		model.addAttribute("findWriteAllGood",findWriteAllGood);
		model.addAttribute("findWriteAllView",findWriteAllView);
		
		
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
}
