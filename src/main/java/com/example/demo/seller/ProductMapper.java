package com.example.demo.seller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	void insert(Product p);
	Product selectByNum(int num);
	List selectByName(String name);
	List selectByPrice(Map map);
	List selectBySellerId(String seller_id);
	List selectByC1(int c1);
	List selectByC2(int c2);
	List selectAll();
	void update(Product p);
	void delete(int num);
	int getNum();
}
