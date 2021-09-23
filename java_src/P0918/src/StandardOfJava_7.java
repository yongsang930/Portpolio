
public class StandardOfJava_7 {
	
	int i = 0;
	
	void buy(product p) {
		if(money < p.price) {
			System.out.println(:"잔액부족");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		cart[i++] = p;
	}
}
