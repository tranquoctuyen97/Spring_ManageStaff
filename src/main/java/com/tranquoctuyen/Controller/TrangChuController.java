package com.tranquoctuyen.Controller;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tranquoctuyen.entity.Record;
import com.tranquoctuyen.entity.Staff;
import com.tranquoctuyen.service.RecordService;
import com.tranquoctuyen.service.StaffService;

@Controller
@SessionAttributes({"staff","check_date","checkrecord"})
public class TrangChuController {
	@Autowired
	StaffService staffService;
	@Autowired
	RecordService recordService;
	
	
	
	@GetMapping("/")
public String viewTrangChu(ModelMap modelMap,HttpSession hSession) {
		if (null==hSession.getAttribute("staff")) {
			return "redirect:/login";
		}
		Staff staff=(Staff) hSession.getAttribute("staff");
		int sonhanvien=staffService.danhsachnhanhvien().size();
		modelMap.addAttribute("sumstaff", sonhanvien);
		Date date=new Date();
		 java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		 List<Record> list=recordService.top10Staff();
		modelMap.addAttribute("check_date", recordService.checkmuster(sqlDate+""));
		modelMap.addAttribute("LIST_TOP10", list);
		modelMap.addAttribute("checkrecord", recordService.checkrecord(sqlDate+"", staff.getDepart().getId()));
		
	return "index";
}
	
}
