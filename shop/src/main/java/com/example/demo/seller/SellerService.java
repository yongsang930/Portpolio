package com.example.demo.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerService {

	@Autowired
	private ProductMapper mapper;

	public void addProduct(Product p) {
		mapper.insert(p);
	}

	public Product getProductByNum(int num) {
		return mapper.selectByNum(num);
	}

	public List getProductByName(String name) {
		return mapper.selectByName(name);
	}

	public List getProductByPrice(int min, int max) {
		Map map = new HashMap();
		map.put("min", min);
		map.put("max", max);
		return mapper.selectByPrice(map);
	}

	public List getProductBySellerId(String seller_id) {
		return mapper.selectBySellerId(seller_id);
	}

	public List getProductByC1(int c1) {
		return mapper.selectByC1(c1);
	}

	public List getProductByC2(int c2) {
		return mapper.selectByC2(c2);
	}

	public List getProductAll() {
		return mapper.selectAll();
	}

	public void editProduct(Product p) {
		mapper.update(p);
	}

	public void delProduct(int num) {
		mapper.delete(num);
	}

	public int getNum() {
		return mapper.getNum();
	}
}
