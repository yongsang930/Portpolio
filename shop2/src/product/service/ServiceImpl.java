package product.service;

import java.util.ArrayList;

import model.Product;
import product.dao.Dao;
import product.dao.DaoImpl;

public class ServiceImpl implements Service {
	private static final String String = null;
	private Dao dao;

	public ServiceImpl() {
		this.dao = new DaoImpl();
	}

	public void add(Product p) {
		dao.insert(p);
	}

	public ArrayList<Product> getProductsById(String s_id) {
		return dao.selectAllById(s_id);
	}

	public Product getProduct(int num) {
		return dao.select(num);
	}

	public void editProduct(Product p) {
		dao.update(p);
	}

	public void delProduct(int num) {
		dao.delete(num);
	}

	public int makeNum() {
		return dao.selectNum();
	}

	public ArrayList<Product> getProductAll() {
		return dao.selectAll();
	}
	
	public ArrayList<String> getProductName(int num) {
		return dao.selectName(num);
	}

	public Product editQuantity(int q, int num) {
		dao.updateQuantity(q,num);

		return getProduct(num);
	}
}
