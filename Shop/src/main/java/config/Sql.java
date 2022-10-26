package config;

public class Sql {
	
	public static final String SELECT_CUSTOMER = "SELECT * FROM `customer`"; 
	public static final String SELECT_PRODUCT = "SELECT * FROM `product`"; 
	
	public static final String SELECT_ORDER = "SELECT a.`orderNo`, b.`name`, c.`prodName`, a.`orderCount`, a.`orderDate` "
											+ "FROM `order` as a "
											+ "join `customer` as b on a.orderId = b.custid "
											+ "join `product` as c on a.orderProduct = c.prodNo";
	
	public static final String INSERT_ORDER = "INSERT INTO `order` "
											+ "(`orderId`, `orderProduct`, `orderCount`, `orderDate`) "
											+ "VALUES (?,?,?,NOW())";
}
