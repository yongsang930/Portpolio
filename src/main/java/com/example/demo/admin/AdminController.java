package com.example.demo.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/admin/getsub")
	public ModelAndView getsub(int type, int p_id) {
		ModelAndView mav = new ModelAndView("admin/getsub");
		ArrayList<Category> list = null;

		switch (type) {
		case 1:
			list = (ArrayList<Category>) service.getAll(1, 0);//상의메뉴가 없으니 0 
			break;
		case 2:
			list = (ArrayList<Category>) service.getAll(2, p_id); // 중분류 선택한 대분류의 id 
			break;
		}

		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/admin/addCategory")  // 카테고리 추가 
	public String addCategory(Category c, @RequestParam(value = "type") int type) {
		service.addCategory(c, type);
		return "member/main";
	}

}
