package com.devsuperior.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.devsuperior.dto.GameDTO;
import com.devsuperior.dto.GameMinDTO;
import com.devsuperior.services.GameService;

@RestController
@RequestMapping(value = "/games")
public class GameController {

	@Autowired
	GameService gameService;
	
	@GetMapping
	public List<GameMinDTO> findAll() {
		return gameService.findAll();
	}
	
	@GetMapping(value = "/{id}")
	public GameDTO findById(@PathVariable Long id) {
		return gameService.findById(id);
	}
}
