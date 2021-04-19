package com.ENotes.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ENotes.Bean.NotesBean;
import com.ENotes.Connection.DBConnectionProvider;

public class NotesDAO {

	private static final String ADD_NOTES = "insert into notes" + "(title,content,userid)" + "values(?,?,?)";
	private static final String LIST_NOTES = "select * from notes where userid=?";
	private static final String EDIT_NOTES = "select * from notes where id=?";
	private static final String UPDATE_NOTES = "update notes set title=?,content=? where id=?";
	private static final String DELETE_NOTES = "delete from notes where id=?";

	public boolean addNotes(NotesBean notes) {
		boolean addFlag = false;
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(ADD_NOTES);
			System.out.println(preparedStatement);

			preparedStatement.setString(1, notes.getTitle());
			preparedStatement.setString(2, notes.getContents());
			preparedStatement.setInt(3, notes.getUserId());

			int addedNotes = preparedStatement.executeUpdate();

			if (addedNotes < 0 || addedNotes != 0) {
				addFlag = true;
				System.out.println("Notes added successfully...");
			} else if (addedNotes > 0 || addedNotes == 1) {
				addFlag = true;
				System.out.println("Notes added successfully...");
			} else {
				System.out.println("Something went wrong.Please try again....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return addFlag;
	}

	public List<NotesBean> getAllNotes(int uid) {
		NotesBean notes = null;
		List<NotesBean> lists = new ArrayList<NotesBean>();
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(LIST_NOTES);
			System.out.println(preparedStatement);

			preparedStatement.setInt(1, uid);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				notes = new NotesBean();
				notes.setId(resultSet.getInt(1));
				notes.setTitle(resultSet.getString(2));
				notes.setContents(resultSet.getString(3));
				notes.setNdate(resultSet.getTimestamp(4));
				notes.setUserId(resultSet.getInt(5));
				lists.add(notes);
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return lists;

	}

	public NotesBean getNotesById(int noteid) {
		NotesBean notes = null;
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(EDIT_NOTES);
			System.out.println(preparedStatement);

			preparedStatement.setInt(1, noteid);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				notes = new NotesBean();
				notes.setId(resultSet.getInt(1));
				notes.setTitle(resultSet.getString(2));
				notes.setContents(resultSet.getString(3));
				notes.setNdate(resultSet.getTimestamp(4));
				notes.setUserId(resultSet.getInt(5));

			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return notes;

	}

	public boolean editNotes(NotesBean notes) {
		boolean editFlag = false;
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(UPDATE_NOTES);
			System.out.println(preparedStatement);

			preparedStatement.setString(1, notes.getTitle());
			preparedStatement.setString(2, notes.getContents());
			preparedStatement.setInt(3, notes.getId());

			int editedNotes = preparedStatement.executeUpdate();

			if (editedNotes < 0 || editedNotes != 0) {
				editFlag = true;
				System.out.println("Notes added successfully...");
			} else if (editedNotes > 0 || editedNotes == 1) {
				editFlag = true;
				System.out.println("Notes added successfully...");
			} else {
				System.out.println("Something went wrong.Please try again....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return editFlag;
	}

	public boolean deleteNotes(int noteid) {
		boolean deleteFlag = false;
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		try {
			connection = DBConnectionProvider.getConnection();
			preparedStatement = connection.prepareStatement(DELETE_NOTES);
			System.out.println(preparedStatement);

			preparedStatement.setInt(1, noteid);

			int deletedNotes = preparedStatement.executeUpdate();

			if (deletedNotes < 0 || deletedNotes != 0) {
				deleteFlag = true;
				System.out.println("Notes deleted successfully...");
			} else if (deletedNotes > 0 || deletedNotes == 1) {
				deleteFlag = true;
				System.out.println("Notes deleted successfully...");
			} else {
				System.out.println("Something went wrong.Please try again....");
			}
		} catch (SQLException ex) {
			DBConnectionProvider.printSQLException(ex);
		}

		return deleteFlag;
	}

}
