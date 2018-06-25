package com.shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.shop.model.CommodityBean;

public class CommodityDAO implements ICommodityDAO {
	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement stmt;
	private SQLException ex;
	private ResultSet rs;

	public CommodityDAO(DataSource defaultDS) {
		this.dataSource = defaultDS;
	}

	@Override
	public List<CommodityBean> getCommodity(String sorting, boolean isDESC) {
		List<CommodityBean> list = new ArrayList<CommodityBean>();

		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM commodity ORDER BY ? ?");
			stmt.setString(1, sorting);
			if (isDESC)
				stmt.setString(2, "DESC");
			else
				stmt.setString(2, "ASC");
			rs = stmt.executeQuery();
			while (rs.next()) {
				CommodityBean cb = new CommodityBean();
				cb.setId(rs.getString("id"));
				cb.setName(rs.getString("name"));
				cb.setCategory(rs.getString("category"));
				cb.setPrice(rs.getInt("price"));
				cb.setQuantity(rs.getInt("quantity"));
				cb.setDetail(rs.getString("detail"));
				cb.setSpec(rs.getString("spec"));
				cb.setImage(rs.getString("image"));
				list.add(cb);
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}

		return list;
	}

	public List<CommodityBean> getCommodity(String sorting, boolean isDESC, String cate) {		//給MEMBER用的
		List<CommodityBean> list = new ArrayList<CommodityBean>();

		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM commodity WHERE category=? ORDER BY ? ?");
			stmt.setString(1, cate);
			stmt.setString(2, sorting);
			if (isDESC)
				stmt.setString(3, "DESC");
			else
				stmt.setString(3, "ASC");
			rs = stmt.executeQuery();
			while (rs.next()) {
				CommodityBean cb = new CommodityBean();
				cb.setId(rs.getString("id"));
				cb.setName(rs.getString("name"));
				cb.setCategory(rs.getString("category"));
				cb.setPrice(rs.getInt("price"));
				cb.setQuantity(rs.getInt("quantity"));
				cb.setDetail(rs.getString("detail"));
				cb.setSpec(rs.getString("spec"));
				cb.setImage(rs.getString("image"));
				list.add(cb);
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}

		return list;
	}

	@Override
	public void updateCommodity(CommodityBean commodity) {
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(
					"UPDATE commodity SET id=?, name=?, category=?, price=?, quantity=?, detail=?, spec=?, image=? WHERE id=?");
			stmt.setString(1, commodity.getId());
			stmt.setString(2, commodity.getName());
			stmt.setString(3, commodity.getCategory());
			stmt.setInt(4, commodity.getPrice());
			stmt.setInt(5, commodity.getQuantity());
			stmt.setString(6, commodity.getDetail());
			stmt.setString(7, commodity.getSpec());
			stmt.setString(8, commodity.getImage());
			stmt.setString(9, commodity.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}

	}

	@Override
	public void deleteCommodity(List<CommodityBean> list) {
		ArrayList<CommodityBean> alist = (ArrayList<CommodityBean>) list;

		try {
			conn = dataSource.getConnection();

			stmt = conn.prepareStatement("DELETE FROM commodity WHERE id=?");
			for (CommodityBean commodity : alist) {
				stmt.setString(1, commodity.getId());
				stmt.executeUpdate();
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}
	}

	@Override
	public void addCommodity(CommodityBean commodity) {
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO commodity(id,name,category,price,quantity,detail,spec,image) VALUES(?,?,?,?,?,?,?,?)");
			stmt.setString(1, todayNum());
			stmt.setString(2, commodity.getName());
			stmt.setString(3, commodity.getCategory());
			stmt.setInt(4, commodity.getPrice());
			stmt.setInt(5, commodity.getQuantity());
			stmt.setString(6, commodity.getDetail());
			stmt.setString(7, commodity.getSpec());
			stmt.setString(8, commodity.getImage());
			stmt.executeUpdate();
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
		}
	}

	public String todayNum() {
		String num;
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyyMMdd");
		num = bartDateFormat.format(new Date());
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement("SELECT MAX(right(id,3))+1 AS max FROM commodity WHERE LEFT(id,8)=?");
			stmt.setString(1, num);
			rs = stmt.executeQuery();
			if (rs.next()) {
				num += rs.getString("max");
			} else {
				num += "001";
			}
		} catch (SQLException e) {
			ex = e;
		} finally {
			closeConnect();
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
