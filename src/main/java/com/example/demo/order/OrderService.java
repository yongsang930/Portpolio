package com.example.demo.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

	@Autowired
	private OrderMapper mapper;

	public void addOrder(Order o) {
		mapper.insert(o);
	}

	Order getOrder(int num) {
		return mapper.select(num);
	}

	public List getOrderAll(String consumer_id, int result) {
		Map map = new HashMap();
		map.put("consumer_id", consumer_id);
		map.put("result", result);
		return mapper.selectAll(map);
	}

	public void editResult(int num, int result) {
		Map map = new HashMap();
		map.put("num", num);
		map.put("result", result);
		mapper.update(map);
	}

	public void delOrder(int num) {
		mapper.delete(num);
	}
	
	public List getProOrder(String seller_id) {
		return mapper.p_select(seller_id);
	}
}
