package config;

public class Sql {
	
	public static final String SELECT_LECTURE = "SELECT * FROM `lecture`";
	public static final String SELECT_STUDENT = "SELECT * FROM `student`";
	public static final String SELECT_REGISTER = "SELECT a.*, b.`LecNo`, c.`StdName`\r\n"
												+ "FROM `register` AS a "
												+ "JOIN `lecture` AS b "
												+ "ON a.`RegLecNo` = b.`LecNo` "
												+ "JOIN `student` AS c "
												+ "ON a.`RegStdNo` = c.`StdNo` "
												+ "WHERE `RegStdNo` = ?";
	
	public static final String INSERT_LECTURE = "INSERT INTO `lecture` "
												+ "VALUES (?,?,?,?,?)";
	
	public static final String INSERT_STUDENT = "INSERT INTO `student`"
												+ "(`StdNo`, `StdName`, `StdHp`, `StdYear`, `StdAddress`) VALUES "
												+ "(?,?,?,?,?)";
	
	public static final String INSERT_REGISTER = "INSERT INTO `Register` "
												+ "(`RegStdNo`, `RegLecNo`) "
												+ "VALUES (?,?)";
												
}
