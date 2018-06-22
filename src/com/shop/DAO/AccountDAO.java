package com.shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.shop.model.AccountBean;

public class AccountDAO implements IAccountDAO {
	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement stmt;
	private SQLException ex;
	private ResultSet rs;

	public AccountDAO(DataSource defaultDS) {
		this.dataSource = defaultDS;
	}

	@Override
	public boolean isUserExisted(AccountBean account) {
		boolean isExisted = false;
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM member WHERE account=?");
			stmt.setString(1, account.getAccount());
			rs = stmt.executeQuery();
			if (rs.next())
				isExisted = true;
			else
				isExisted = false;

		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}
		return isExisted;
	}

	@Override
	public void addAccount(AccountBean account) {
		String[] accountContent = { account.getAccount(), account.getPassword(), account.getName(), account.getAddr(),
				account.getTel(), account.getEmail() };
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO member(account,password,name,addr,tel,email,privilege) VALUES(?,?,?,?,?,?,0)");
			for (int i = 0; i < accountContent.length; i++)
				stmt.setString(i+1, accountContent[i]);
			stmt.executeUpdate();
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}
	}

	@Override
	public AccountBean getAccount(AccountBean account) {
		// TODO Auto-generated method stub
		return null;
	}

	public void closeConnect() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				if (ex == null)
					ex = e;
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				if (ex == null) {
					ex = e;
				}
			}
		}
		if (ex != null)
			throw new RuntimeException(ex);
	}

}
