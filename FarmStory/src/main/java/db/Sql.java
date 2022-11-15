package db;

public class Sql {
	
	public static final String SELECT_USER = "SELECT * FROM `board_user` WHERE `uid`=? AND `pass`=SHA2(?, 256)";

}
