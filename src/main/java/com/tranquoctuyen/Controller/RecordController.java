package com.tranquoctuyen.Controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tranquoctuyen.entity.Reason;
import com.tranquoctuyen.entity.Record;
import com.tranquoctuyen.entity.Staff;
import com.tranquoctuyen.service.ReasonService;
import com.tranquoctuyen.service.RecordService;
import com.tranquoctuyen.service.StaffService;

@Controller
@RequestMapping("/record")
@SessionAttributes({"staff","check_date","checkrecord"})
public class RecordController {
@Autowired
StaffService staffService;
@Autowired
RecordService recordService;
@Autowired
ReasonService reasonService;
	@GetMapping("/muster")
	public String defaultMuster(ModelMap modelMap,HttpSession httpSession) {
		Staff staff=(Staff) httpSession.getAttribute("staff");
		List<Staff> getstaffbydepart= staffService.getAllbyDepartid(staff.getDepart().getId());
		
		modelMap.addAttribute("LIST_STAFF", getstaffbydepart);
		
		return "muster";
	}
	@GetMapping
	public String defaultrecord(ModelMap modelMap,HttpSession httpSession) {
		List<Reason> getAllreason=reasonService.getAllreason();
		Staff staff= (Staff) httpSession.getAttribute("staff");
		List<Staff> getstaffbydepart = staffService.getAllbyDepartid(staff.getDepart().getId());
		
		modelMap.addAttribute("LIST_STAFF", getstaffbydepart);
		modelMap.addAttribute("LIST_REASON", getAllreason);
		
		return "demo";
	}
	@RequestMapping(value="/insertmuster",produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
	@ResponseBody
	public String insertMuster(@RequestParam String dataJson,HttpSession httpSession) {
		
		Staff staff_session=(Staff) httpSession.getAttribute("staff");
		Date date=new Date();
		 java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		ObjectMapper objectMapper = new ObjectMapper();
		
		JsonNode jsonObject;
		
		try {
			jsonObject = objectMapper.readTree(dataJson);
			

			for (int j = 0; j < jsonObject.size(); j++) {
				int bien=jsonObject.get(""+j+"").asInt();
				for (int i = 0; i < staffService.getAllbyDepartid(staff_session.getDepart().getId()).size(); i++) {
					
					if (bien==staffService.danhsachnhanhvien().get(i).getId()) {
						Record record=new Record();
						Staff staff=new Staff();
						Reason reason=new Reason();
						reason.setId(1);
						staff.setId(jsonObject.get(""+j+"").asInt());
						record.setStaff(staff);	
						record.setReason(reason);
						record.setDate(sqlDate+"");
						record.setType(-1);
						recordService.insermuster(record);
					}else {
						Reason reason=new Reason();
						reason.setId(1);
						Record record=new Record();
						Staff staff=new Staff();
						staff.setId(staffService.danhsachnhanhvien().get(i).getId());
						record.setStaff(staff);	
						record.setReason(reason);
						record.setDate(sqlDate+"");
						record.setType(1);
						recordService.insermuster(record);
						
					}
					
					
				}

				
			}
			Staff staff=(Staff) httpSession.getAttribute("staff");
			httpSession.setAttribute("check_date", recordService.checkmuster(sqlDate+""));
			httpSession.setAttribute("checkrecord", recordService.checkrecord(sqlDate+"", staff.getDepart().getId()));
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "muster";
	}

	
}
