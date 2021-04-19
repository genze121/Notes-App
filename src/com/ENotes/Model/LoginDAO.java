package com.ENotes.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ENotes.Bean.UserBean;
import com.ENotes.Connection.DBConnectionProvider;

public class LoginDAO {

	private static final String LOGIN_USER = "select * from user_ where username=? and password=?";

	public UserBean loginUser(String username, String password) {
		UserBean user = null;
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(LOGIN_USER);
			System.out.println(preparedStatement);

			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				user = new UserBean();
				user.setId(resultSet.getInt(1));
				user.setFirstname(resultSet.getString(2));
				user.setLastname(resultSet.getString(3));
				user.setUsername(resultSet.getString(4));
				user.setPassword(resultSet.getString(5));
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return user;
	}
}
