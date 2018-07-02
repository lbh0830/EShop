package com.shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import com.shop.model.OrderMainBean;

public class OrderDAO implements IOrderDAO {
	private DataSource dataSource;
	private Connection conn, conn1;
	private PreparedStatement stmt, stmt1;
	private SQLException ex;
	private ResultSet rs;
	
	
	@Override
	public void addOrderMain(OrderMainBean omb) {
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO ordermain(id,mem_id,date,receiver,addr,tel,process) VALUES(?,?,?,?,?,?,?)");
			stmt.setString(1, omb.getId()+);
			stmt.setString(2, );
			stmt.setString(3, );
			stmt.setInt(4, );
			stmt.setInt(5, );
			stmt.setString(6, );
			stmt.setString(7, );
			stmt.executeUpdate();
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}

	}

	@Override
	public void addOrderExt(OrderMainBean omb) {
		

	}

	@Override
	public void updateProcess(OrderMainBean omb) {
		

	}
	public String todayNum() {
		String num;
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyyMMdd");
		num = bartDateFormat.format(new Date());
		try {
			conn1 = dataSource.getConnection();
			stmt1 = conn1
					.prepareStatement("SELECT LPAD(MAX(right(id,3))+1,3,0) AS max FROM commodity WHERE LEFT(id,8)=?");
			stmt1.setString(1, num);
			rs = stmt1.executeQuery();
			rs.next();
			if (rs.getString("max") != null) {
				num += rs.getString("max");
			} else {
				num += "001";
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			if (conn1 != null) {
				try {
					conn1.close();
				} catch (SQLException e) {
					if (ex == null)
						ex = e;
				}
			}
			if (stmt1 != null) {
				try {
					stmt1.close();
				} catch (SQLException e) {
					if (ex == null) {
						ex = e;
					}
				}
			}
			if (ex != null)
				throw new RuntimeException(ex);
		}
		return num;
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
