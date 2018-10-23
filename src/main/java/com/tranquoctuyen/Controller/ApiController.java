package com.tranquoctuyen.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import java.util.Date;

import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tranquoctuyen.entity.JSON_Staff;
import com.tranquoctuyen.entity.Reason;
import com.tranquoctuyen.entity.Record;
import com.tranquoctuyen.entity.Staff;
import com.tranquoctuyen.service.ReasonService;
import com.tranquoctuyen.service.RecordService;
import com.tranquoctuyen.service.StaffService;

@Controller
@RequestMapping("/api")
@SessionAttributes({"staff","check_date","checkrecord"})
public class ApiController {
	@Autowired
	ServletContext context;
	@Autowired
	StaffService staffService;
	@Autowired
	RecordService recordService;
	@Autowired
	ReasonService reasonService;

	@GetMapping("/kiemtradangnhap")
	@ResponseBody
	public String kiemtradangnhap(@RequestParam String username, @RequestParam String password, ModelMap modelMap) {
		boolean kiemtra = staffService.checklogin(username, password);
		if (kiemtra) {
			modelMap.addAttribute("staff", staffService.findtUser(username));
		}

		return "" + kiemtra;
	}

	@PostMapping("/uploadfile")
	@ResponseBody

	public String uploadfile(MultipartHttpServletRequest request) {
		String path_save_file = context.getRealPath("/resources/img/staff/");
		Iterator<String> listNames = request.getFileNames();
		MultipartFile mpf = request.getFile(listNames.next());

		System.out.println(mpf.getOriginalFilename());
		File file_save = new File(path_save_file + "\\" + mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "true";
	}

	@GetMapping("/kiemtraemail")
	@ResponseBody
	public String kiemtraemail(String email) {
		Staff kt = staffService.findtUser(email);
		if (kt != null) {
			return "true";
		} else {
			return "false";

		}

	}

	@GetMapping("/logout")
	public String logout(HttpSession hSession) {
		hSession.removeAttribute("staff");
		return "redirect:/login";
	}

	@GetMapping("/kiemtraphone")
	@ResponseBody
	public String kiemtraphone(String phone) {
		boolean kt = staffService.checkphone(phone);
		return kt + "";

	}

	@PostMapping(path = "/viewRecord", produces = "application/json; charset=utf-8")
	@ResponseBody
	public JSON_Staff viewRecord(@RequestParam int id) {

		JSON_Staff jSON_Staff = new JSON_Staff();
		Staff staff = staffService.findbyID(id);
		jSON_Staff.setId(staff.getId());
		jSON_Staff.setBirthday(staff.getBirthday());

		jSON_Staff.setEmail(staff.getEmail());
		jSON_Staff.setGender(staff.getGender());
		jSON_Staff.setName(staff.getName());
		jSON_Staff.setNotes(staff.getName());
		jSON_Staff.setPassword(staff.getPassword());
		jSON_Staff.setPhone(staff.getPhone());
		jSON_Staff.setPhoto(staff.getPhoto());
		jSON_Staff.setRoles(staff.getRoles());
		return jSON_Staff;
	}

	@PostMapping(path = "/insertRecord", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String insertRecord(@RequestParam String dataJson, @RequestParam int id) {

		Date date = new Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonObject;
		ArrayList<String> list = new ArrayList<String>();
		try {

			jsonObject = objectMapper.readTree(dataJson);
			for (int i = 1; i < reasonService.getAllreason().size(); i++) {
				list.add(reasonService.getAllreason().get(i).getId() + "");
			}
			for (JsonNode jsonNode : jsonObject) {
				Record record = new Record();
				Staff staff = new Staff();
				Reason reason = new Reason();
				reason.setId(jsonNode.asInt());
				staff.setId(id);
				record.setStaff(staff);
				record.setReason(reason);
				record.setDate(sqlDate + "");
				record.setType(-2);
				recordService.insermuster(record);
				list.remove(jsonNode.asInt() + "");
			}
			for (int i = 0; i < list.size(); i++) {
				Record record = new Record();
				Staff staff = new Staff();
				Reason reason = new Reason();
				reason.setId(Integer.parseInt(list.get(i)));
				staff.setId(id);
				record.setStaff(staff);
				record.setReason(reason);
				record.setDate(sqlDate + "");
				record.setType(2);
				recordService.insermuster(record);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "true";
	}

}
