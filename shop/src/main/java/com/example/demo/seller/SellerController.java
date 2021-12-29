package com.example.demo.seller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.admin.AdminService;
import com.example.demo.order.Order;
import com.example.demo.order.OrderService;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	@Autowired
	private OrderService o_service;

	public static String basePath = "C:\\shopimg\\";

	@RequestMapping("/seller/myList")
	public ModelAndView myList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("member/prodPage");
		HttpSession session = req.getSession(false);
		String seller_id = (String) session.getAttribute("id");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/form")
	public void form() {
	}

	public void saveImg(int num, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName != null && !fileName.equals("")) {
			File dir = new File(basePath + num);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			File f = new File(basePath + num + "\\" + fileName);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/seller/add")
	public String add(Product p) {
		int num = service.getNum();
		p.setNum(num);
		service.addProduct(p);
		saveImg(num, p.getFile1());
		saveImg(num, p.getFile2());
		saveImg(num, p.getFile3());
		return "member/main";
	}

	@RequestMapping(value = "/seller/itemView")
	public ModelAndView itemView(int num, int type) {
		ModelAndView mav = new ModelAndView();
		if (type == 1) {
			mav.setViewName("seller/itemView");
		} else if (type == 2) {
			mav.setViewName("order/itemView");
		}
		Product p = service.getProductByNum(num);
		String path = basePath + p.getNum() + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				mav.addObject("file" + j, files[j]);
			}
		}

		mav.addObject("p", p);
		return mav;
	}

	@RequestMapping(value = "/seller/edit")
	public String edit(Product p) {
		service.editProduct(p);
		return "member/main";
	}

	@RequestMapping("/seller/del")
	public String del(int num, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		ArrayList<Order> order = (ArrayList<Order>) o_service.getProOrder(id);
		int i = 0;
		for (Order o : order) {
			Product product = (Product) service.getProductByNum(o.getPro_num());
			if (product == null) {
				i++;
			}
		}
		if (i > 0) {
			return "member/main";
		}
		service.delProduct(num);
		String path = basePath + num + "\\";
		File imgDir = new File(path);
		if (imgDir.exists()) {
			String[] files = imgDir.list();
			for (int j = 0; j < files.length; j++) {
				File f = new File(path + files[j]);
				f.delete();
			}
		}
		imgDir.delete();
		return "member/main";
	}

	@RequestMapping(value = "/seller/allList")
	public ModelAndView allList() {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductAll();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/cateList")
	public ModelAndView cateList(@RequestParam(required = true) int c1, @RequestParam(defaultValue = "0") int c2) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = null;
		if (c2 == 0) {
			list = (ArrayList<Product>) service.getProductByC1(c1);
		} else {
			list = (ArrayList<Product>) service.getProductByC2(c2);
		}
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/nameList")
	public ModelAndView nameList(@RequestParam(value = "name") String name) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductByName(name);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/priceList")
	public ModelAndView priceList(@RequestParam(value = "min") int min, @RequestParam(value = "max") int max) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductByPrice(min, max);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/seller/sellerList")
	public ModelAndView sellerList(@RequestParam(value = "seller_id") String seller_id) {
		ModelAndView mav = new ModelAndView("seller/allList");
		ArrayList<Product> list = (ArrayList<Product>) service.getProductBySellerId(seller_id);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(String fname, int num) {
		String path = basePath + num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping("/seller/orderList")
	public void orderList(Model m, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		int type = (Integer) session.getAttribute("type");
		String id = "";
		if (type == 1) {
			id = (String) session.getAttribute("id");

			ArrayList<Order> o_list = (ArrayList<Order>) o_service.getProOrder(id);

			for (int i = 0; i < o_list.size(); i++) {
				Product p = (Product) service.getProductByNum(((Integer) o_list.get(i).getPro_num()));
				o_list.get(i).setP(p);
			}
			m.addAttribute("o_list",o_list);
		}
	}
}
