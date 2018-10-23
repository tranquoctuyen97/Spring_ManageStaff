package com.tranquoctuyen.Controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;





@Controller
@RequestMapping("/login")
public class LoginController {
	@GetMapping
public String defaultlogin() {
	return "login";
}
	
	
@PostMapping
public String xulidangnhap(@RequestParam String username,@RequestParam String password) {
	
		return "login";
	
		
	
	
}

}
