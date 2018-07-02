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
	public OrderDAO(DataSource defaultDS) {
		this.dataSource = defaultDS;
	}
	
	@Override
	public void addOrderMain(OrderMainBean omb) {
		omb.setId(todayNum());
		try {
			conn = dataSource.getConnection();
			//主檔
			stmt = conn.prepareStatement(
					"INSERT INTO ordermain(id,mem_id,date,receiver,addr,tel,process,note) VALUES(?,?,?,?,?,?,?,?)");
			stmt.setString(1, omb.getId());
			stmt.setString(2, omb.getMemId());
			stmt.setString(3, omb.getDate());
			stmt.setString(4, omb.getReceiver());
			stmt.setString(5, omb.getAddr());
			stmt.setString(6, omb.getTel());
			stmt.setString(7, omb.getProcess());
			stmt.setString(8, omb.getNote());
			stmt.executeUpdate();
			//副檔
			stmt = conn.prepareStatement("INSERT INTO orderext(id,commodity_id,price,buyquantity) VALUES(?,?,?,?)");
			for(int i=0;i<omb.getExt().length;i++) {
				stmt.setString(1, omb.getId());
				stmt.setString(2, omb.getExt()[i].getCommodityId());
				stmt.setInt(3, omb.getExt()[i].getPrice());
				stmt.setInt(4, omb.getExt()[i].getBuyquantity());	
				stmt.executeUpdate();
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}

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
					.prepareStatement("SELECT LPAD(MAX(right(id,4))+1,4,0) AS max FROM ordermain WHERE LEFT(id,9)=?");
			stmt1.setString(1, "A"+num);
			rs = stmt1.executeQuery();
			rs.next();
			if (rs.getString("max") != null) {
				num += rs.getString("max");
			} else {
				num += "0001";
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
		return "A"+num;
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
