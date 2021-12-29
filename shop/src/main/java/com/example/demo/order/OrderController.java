package com.example.demo.order;

import java.io.File;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.seller.Product;
import com.example.demo.seller.SellerService;

@Controller
public class OrderController {
	public static String basePath = "C:\\shopimg\\";

	@Autowired
	private OrderService service;

	@Autowired
	private SellerService s_service;
	
	@RequestMapping("/order/orderView")
	public ModelAndView order(Order order) {
		ModelAndView mav = new ModelAndView("order/orderView");
		Product p = s_service.getProductByNum(order.getPro_num());
		order.setP(p);
		mav.addObject("order",order);
		return mav;
	}

	@RequestMapping("/order/order2")
	public String order2(Order o) {
		Product p = s_service.getProductByNum(o.getPro_num());
		if (o.getQuantity() <= p.getQuantity()) {
			service.addOrder(o);
			System.out.println(o);
			p.setQuantity(p.getQuantity() - o.getQuantity());
			s_service.editProduct(p);
			System.out.println(o);
		}
		return "redirect:/order/myOrderList";
	}

	@RequestMapping("/order/myOrderList")
	public ModelAndView myOrderList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("order/myOrderList");
		HttpSession session = req.getSession(false);
		String consumer_id = (String) session.getAttribute("id");
		ArrayList<Order> list = (ArrayList<Order>) service.getOrderAll(consumer_id, 1);

		for (int i = 0; i < list.size(); i++) {
			Order o = list.get(i);
			o.setP(s_service.getProductByNum(o.getPro_num()));
		}
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/order/itemView")
	public ModelAndView itemView(int num, int type) {
		ModelAndView mav = new ModelAndView();
		Product pp = s_service.getProductByNum(num);
		String path = basePath + pp.getNum() + "\\";
		File imgDir = new File(path);
		mav.setViewName("order/itemView");
		
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("pp", pp);
		return mav;
	}
}
