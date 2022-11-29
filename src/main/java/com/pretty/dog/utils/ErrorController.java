package com.pretty.dog.utils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "/error/400", method = RequestMethod.GET)
	public String saback(Model model) {
		model.addAttribute("code","400에러입니다.");
		return "cywError";
	}
	
	@RequestMapping(value = "/error/404", method = RequestMethod.GET)
	public String notfound(Model model) {
		model.addAttribute("code","404에러입니다.");
		return "cywError";
	}
	@RequestMapping(value = "/error/500", method = RequestMethod.GET)
	public String oback(Model model) {
		model.addAttribute("code","500에러입니다.");
		return "cywError";
	}
	
}
