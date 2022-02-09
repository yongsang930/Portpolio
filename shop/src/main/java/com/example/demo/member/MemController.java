package com.example.demo.member;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableLoadTimeWeaving;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.AsyncHandlerMethodReturnValueHandler;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.order.Order;
import com.example.demo.seller.Product;

@Controller
public class MemController {

	@Autowired
	private MemberService service;

	@Autowired
	private com.example.demo.seller.SellerService p_service;

	@Autowired
	private com.example.demo.order.OrderService o_service;

	@RequestMapping("/")
	public String index() {
		return "redirect:/member/loginForm";
	}

	@GetMapping("/member/loginForm")
	public void loginForm() {
	}

	@RequestMapping("/member/joinForm")
	public void form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("idCheck", false);
	}

	@RequestMapping("/member/login")
	public String login(HttpServletRequest req, Member m) {
		Member m2 = service.getMember(m.getId());
		if (m2 == null || !m2.getPwd().equals(m.getPwd())) {
			String fail = "아이디 혹은 비밀번호가 일치하는 계정이 없습니다.";
			System.out.println(fail);
			req.setAttribute("fail", fail);
			return "member/loginForm";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("id", m2.getId());
			session.setAttribute("type", m2.getType());
			return "member/main";
		}
	}

	@RequestMapping("/member/idCheck")
	public ModelAndView idCheck(HttpServletRequest req, String id) {
		System.out.println(id);
		HttpSession session = req.getSession(false);
		ModelAndView mav = new ModelAndView("/member/idCheck");
		String result = "";
		Member m = service.getMember(id);
		if (m == null) {
			result = "사용이 가능합니다.";
			session.setAttribute("idCheck", true);
		} else {
			result = "이미 사용중인 아이디입니다.";
			session.setAttribute("idCheck", false);
		}
		System.out.println(session.getAttribute("idCheck"));
		mav.addObject("result", result);
		return mav;
	}

	@RequestMapping("/member/join")
	public String join(Member m) {
		service.addMember(m);
		return "member/loginForm";
	}

	@RequestMapping("/member/editForm")
	public void editForm(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getMember(id);
		if (m == null) {
			System.out.println("id없음");
		} else {
			System.out.println("아이디 있음");
		}
		model.addAttribute("m", m);
	}

	@RequestMapping("/member/edit")
	public String edit(Member m) {
		service.editMember(m);
		return "member/main";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "member/loginForm";
	}

	@RequestMapping("/member/out")
	public String out(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		service.delMember(id);
		session.removeAttribute("id");
		session.invalidate();
		return "member/loginForm";
	}

	@RequestMapping("/member/orderPage")
	public String orderPage() {
		return "member/orderPage";
	}

	@RequestMapping("/member/prodPage")
	public void prodPage(Model m, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession(false);
		int type = (Integer) session.getAttribute("type");
		String id = (String) session.getAttribute("id");

		if (type == 1) {
			ArrayList<Product> p_list = (ArrayList<Product>) p_service.getProductBySellerId(id);
			m.addAttribute("p_list", p_list);
		} else if (type == 2) {
			ArrayList<Product> p_list = (ArrayList<Product>) p_service.getProductAll();
			m.addAttribute("p_list", p_list);
			ArrayList<Order> o_list = (ArrayList<Order>) o_service.getOrderAll(id, 1);
			m.addAttribute("o_list", o_list);
		}
	}

	@RequestMapping("/member/adminPage")
	public String adminPage() {
		return "member/adminPage";
	}

	@RequestMapping("/member/main")
	public String mainPage() {
		return "member/main";
	}

	@RequestMapping("/member/calculator")
	public String calculator() {
		return "member/calculator";
	}
}
