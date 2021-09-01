import java.util.Scanner;
 
public class FirstClass2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
 
        Shape moon = new Shape(scan.nextInt(),scan.nextInt());
 
        scan.close();
 
        System.out.println(moon.quad());
        
 
    }
}
 
class Shape {
	private int n, m;
 
	Shape(int n, int m) {
        this.n = n;
        this.m = m;
    }
 
    int quad() {
    	int ret = (int)Math.pow(n, m);
    	return ret;
    }
}