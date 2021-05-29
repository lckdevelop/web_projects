package com.thank.store.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class ErrorController {
	@GetMapping
	public String defaultError() {
		return "error/default";
	}

	@GetMapping("/no-resource")
	public String noResource() {
		return "error/page-error-404";
	}

	@GetMapping("/server-error")
	public String serverError() {
		return "error/serverError";
	}
}