package com.tranquoctuyen.Controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.tranquoctuyen.entity.Depart;
import com.tranquoctuyen.entity.Staff;
import com.tranquoctuyen.service.DepartService;
import com.tranquoctuyen.service.StaffService;

@Controller
@RequestMapping("/staff")
@SessionAttributes({"staff","check_date","checkrecord"})

public class StaffController {

	@Autowired
	StaffService staffService;
	@Autowired
	DepartService departService;

	@GetMapping
	public String defaultStaff(ModelMap modelMap,HttpSession hSession) {
		if (null==hSession.getAttribute("staff")) {
			return "redirect:/login";
		}
		List<Staff> dsnhanvien = staffService.listnhanhvien10(0);
		List<Staff> getallnhanvien = staffService.danhsachnhanhvien();
		double page = Math.ceil((double) getallnhanvien.size() / 10);
		modelMap.addAttribute("LIST_STAFF", dsnhanvien);
		modelMap.addAttribute("page", page);
		return "staff";
	}

	@GetMapping("/editstaff/{id}")
	public String hienthinhanvien(@PathVariable int id, ModelMap modelMap,HttpSession hSession) {
		if (null==hSession.getAttribute("staff")) {
			return "redirect:/login";
		}
		Staff staff = staffService.hienthinhanvien(id);
		modelMap.addAttribute("STAFF", staff);
		List<Depart> list = departService.getAllDepart();
		modelMap.addAttribute("LIST_DEPART", list);
		return "editstaff";
	}

	@GetMapping("/deletestaff")
	@ResponseBody
	public String xoanhanvien(@RequestParam int id) {
		boolean kt = staffService.deletenhanvien(id);
		return kt + "";
	}

	@RequestMapping(value = "/pagestaff", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
	@ResponseBody
	public String defaultStafs(int start, HttpServletRequest request, HttpSession hSession) {
		Staff staff_session = null;
		if (null != hSession.getAttribute("staff")) {
			staff_session = (Staff) hSession.getAttribute("staff");
		}
		String html = "";
		for (Staff staff : staffService.listnhanhvien10((start - 1) * 10)) {
			html += "<tr class='odd gradeX'>";
			if (staff.getPhoto() .equals("")) {
				html += " <td class='user-avatar'> <img src='" + request.getContextPath()
						+ "/resources/img/staff/images.png' alt='Avatar'>" + staff.getName() + "</td>";
			} else {

				html += " <td class='user-avatar'> <img src='" + request.getContextPath() + "/resources/img/staff/"+ staff.getPhoto() + "' alt='Avatar'>" + staff.getName() + "</td>";
			}
			if (staff.getGender()==1) {
				html += "<td>Nam</td>";
			} else {
				html += "<td>Nữ</td>";
			}
			
			html += "<td> " + staff.getBirthday() + "</td>";
			html += "<td class='center'> " + staff.getEmail() + "</td>";
			html += "<td class='center'> " + staff.getPhone() + "</td>";
			html += " <td class='center'>" + staff.getSalary() + "</td>";
			html += " <td class='center'>" + staff.getDepart().getName() + "</td>";
			html += "<td class='actions'>";
			if (staff_session.getRoles().equalsIgnoreCase("admin")) {
				html += " <a href='/staff/editstaff/" + staff.getId()
						+ "' class='icon mdi mdi-edit'></a>&emsp;| &emsp; ";
				html += "<button class='btn btn-danger mdi mdi-delete btnxoanv' data-id='" + staff.getId()
						+ "'data-name='" + staff.getName() + "'></button></td>";
			} else {
				html += "<a class='btn-lg mdi mdi-eye viewstaff' data-toggle='modal' data-target='#myModal' data-id="
						+ staff.getId() + "></a>";
			}
			html += "</tr>";
		}
		return html;
	}

	@GetMapping("/newStaff")
	public String inserstaff(ModelMap map,HttpSession hSession) {
		if (null==hSession.getAttribute("staff")) {
			return "redirect:/login";
		}
		map.addAttribute("LIST_DEPART", departService.getAllDepart());
		return "newStaff";
	}

	@GetMapping(value = "/viewtaff",produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String viewStafs(int id,HttpServletRequest request) {

		Staff staff = staffService.findbyID(id);
		String html = "";

		html += "<div class='modal-content'>";
		html += "<div class='modal-header'>";
		html += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
		html += "<h4 class='modal-title'>Nhân Viên </h4>";
		html += "</div>";
		html += "<div class='modal-body col-sm-4'>";
		if (staff.getPhoto().equals("")) {
			html += "<img src='"+request.getContextPath()+"/resources/img/staff/images.png' class='img-responsive'>";
		} else {
			
			html += "<img src='"+request.getContextPath()+"/resources/img/staff/" + staff.getPhoto() + "' class='img-responsive'>";
		}

		html += "<p class='icon mdi mdi-gender-male'>" + staff.getName() + "</p>";
		html += "</div>";
		html += "<div class=' col-sm-5'>";
		html += "<p class='text-sm-right'>Email : " + staff.getEmail() + "</p>";
		html += "<p class='text-sm-right'>Số điện thoại : " + staff.getPhone() + "</p>";
		html += "<p class='text-sm-right'>Ngày Sinh : " + staff.getBirthday() + "</p>";
		html += "<p class='text-sm-right'>Phòng Ban : " + staff.getDepart().getName() + "</p>";
		if (staff.getNotes() != null) {
			html += "<p class='text-sm-right'>Ghi chú : " + staff.getNotes() + "</p>";
		}
		html += "</div>";
		html += "</div>";
		return html;
	}

	@RequestMapping(value = "/insertStaff", method = RequestMethod.GET)
	public String insestaff(@RequestParam String name, @RequestParam String phone, @RequestParam String email,
			@RequestParam String birthday, @RequestParam String gender, @RequestParam int departid,
			@RequestParam double salary, @RequestParam String password, @RequestParam String notes,
			@RequestParam String photo) {
		Staff staff = new Staff();
		staff.setName(name);
		staff.setEmail(email);
		staff.setBirthday(birthday);
		staff.setPhone(phone);
		staff.setPhoto(photo);
		if (gender.equalsIgnoreCase("nam")) {
			staff.setGender(1);
		} else {
			staff.setGender(0);
		}
		Depart depart = new Depart();
		depart.setId(departid);
		staff.setSalary(salary);
		staff.setPassword(password);
		staff.setDepart(depart);
		staff.setNotes(notes);
		staff.setRoles("nhân viên");
		staffService.insertnhanvien(staff);
		return "redirect:/staff";
	}
	

}

//