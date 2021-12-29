package com.example.demo.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
	void insert(Order o);

	Order select(int num);

	List selectAll(Map map);

	void update(Map map);

	void delete(int num);
	
	List p_select(String seller_id);
	
}
