package com.tranquoctuyen.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tranquoctuyen.entity.Depart;
import com.tranquoctuyen.service.DepartService;

@Controller
@RequestMapping("/depart")
@SessionAttributes({"staff","check_date","checkrecord"})
public class DepartController {
	@Autowired
	DepartService departService;

	@GetMapping
	public String viewdepart(ModelMap map, HttpSession hSession) {
		if (null == hSession.getAttribute("staff")) {
			return "redirect:/login";
		}
		List<Depart> list = departService.getAllDepart();
		map.addAttribute("LIST_DEPART", list);
		return "depart";
	}

	@GetMapping("/deleteDepart")
	@ResponseBody
	public String deletedepart(@RequestParam int id) {
		boolean kt = departService.deletedepart(id);
		return kt + "";
	}

	@GetMapping("/editdepart/{id}")
	public String viewedit(@PathVariable int id,ModelMap modelMap) {
		Depart depart=departService.findbyId(id);
		modelMap.addAttribute("action", "update");
		
		modelMap.addAttribute("DEPART", depart);
		return "actiondepart";
	}
	@PostMapping("/update")
	public String update(@RequestParam int id,@RequestParam String name) {
		Depart depart=new Depart();
		depart.setId(id);
		depart.setName(name);
		departService.updateDepart(depart);
		return  "redirect:/depart";
	}
	@GetMapping("/insertdepart")
	public String insertdepart(ModelMap modelMap) {
		modelMap.addAttribute("action", "savedepart");
		return "actiondepart";
	}
	@PostMapping(value="/savedepart")
	public String insertdepart(@RequestParam String name) {
		Depart depart=new Depart();
		depart.setName(name);
		departService.insertdepart(depart);
		return  "redirect:/depart";
	}
}
