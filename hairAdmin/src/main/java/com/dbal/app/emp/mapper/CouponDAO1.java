package com.dbal.app.emp.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.yedam.hairshop.common.ConnectionManager;
import com.yedam.hairshop.model.CouponVo;
import com.yedam.hairshop.model.MembersEventVo;

public class CouponDAO1 {
	static Connection conn;
	PreparedStatement pstmt;

	static CouponDAO1 instance = null;
	final static String selectAll = "select * from hs_coupon";
	final static String insert = "insert into hs_coupon(HSC_NO,HS_NO,HSC_ISSUEDATE,HSC_EXPIREDATE,HSC_COUPON_QUANTITY,HSC_DISCOUNT_RATE,HSC_MAXDISCOUNT_PAY,HSC_NAME) "
			+ "values( hsc_no_seq.nextval,?,?,?,?,?,?,?)";

	public static CouponDAO1 getInstance() {
		if (instance == null)
			instance = new CouponDAO1();
		return instance;
	}

	public void insert(CouponVo vo) {

		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(insert); // 예외처리
			System.out.println(insert);
			pstmt.setString(1, vo.getHs_no());
			pstmt.setString(2, vo.getHsc_issuedate());
			pstmt.setString(3, vo.getHsc_expiredate());
			pstmt.setString(4, vo.getHsc_coupon_quantity());
			pstmt.setString(5, vo.getHsc_discount_rate());
			pstmt.setString(6, vo.getHsc_maxdiscount_pay());
			pstmt.setString(7, vo.getHsc_name());
			int r = pstmt.executeUpdate();
			// 3.결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결해제(DB에 접속 session수는 제한적 그래서 해제해야됨)
			ConnectionManager.close(conn);
		}
	}
	public void delete(CouponVo vo) {

		try {
			// 1.DB연결
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement(" delete from hs_coupon where hsc_no =? "); // 예외처리
			System.out.println(insert);
			pstmt.setString(1, vo.getHsc_no());
		
			int r = pstmt.executeUpdate();
			// 3.결과 처리
			System.out.println(r + " 건이 처리됨");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 4. 연결해제(DB에 접속 session수는 제한적 그래서 해제해야됨)
			ConnectionManager.close(conn);
		}
	}

	public ArrayList<CouponVo> selectAll(CouponVo vo) {
		ArrayList<CouponVo> list = new ArrayList<>();
		ResultSet rs = null;
		try {
			conn = ConnectionManager.getConnnect();

			pstmt = conn.prepareStatement("SELECT\n" + 
					"    CASE\n" + 
					"        WHEN hsc_coupon_quantity < 1  THEN\n" + 
					"            '소진'\n" + 
					"        WHEN hsc_expiredate < sysdate THEN\n" + 
					"            '만료 '\n" + 
					"        WHEN hsc_issuedate > sysdate  THEN\n" + 
					"            '발급전 '\n" + 
					"        WHEN hsc_expiredate > sysdate  THEN\n" + 
					"            '발급중'\n" + 
					"    END hsc_status,\n" + 
					"    c.*,\n" + 
					"    h.*\n" + 
					"FROM\n" + 
					"    hs_coupon   c\n" + 
					"    JOIN hairshop    h ON ( h.hs_no = c.hs_no )");

			rs = pstmt.executeQuery();
			System.out.println("nqnasql");
			while (rs.next()) {

				CouponVo resultVo = new CouponVo();
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setHs_no(rs.getString("hs_no"));
				resultVo.setHs_name(rs.getString("hs_name"));
				resultVo.setHsc_status(rs.getString("hsc_status"));

				resultVo.setHsc_name(rs.getString("HSC_NAME"));
				resultVo.setHsc_issuedate(rs.getString("HSC_ISSUEDATE").substring(0,10));
				resultVo.setHsc_expiredate(rs.getString("HSC_expiredate").substring(0,10));
				resultVo.setHsc_coupon_quantity(rs.getString("HSC_coupon_quantity"));
				resultVo.setHsc_discount_rate(rs.getString("HSC_DISCOUNT_RATE"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("HSC_MAXDISCOUNT_PAY"));

				list.add(resultVo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
//		
//		for(SalesVo vo : list) {
//			System.out.println(vo.getHName());
//		}
		return list;
	}
	
	
	//린아 타임~
	
	// 보유중인 쿠폰리스트 뿌리기
	public ArrayList<MembersEventVo> memCouponList(MembersEventVo eventVo) {
		ResultSet rs = null;
		MembersEventVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<MembersEventVo> list = new ArrayList<MembersEventVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT M.MC_NO, M.HSC_NO, M.MEM_NO, M.MC_ISSUEDATE, M.MC_EXPIREDATE, M.MC_USED,"
					+ " S.HSC_DISCOUNT_RATE, S.HSC_MAXDISCOUNT_PAY, S.HSC_NAME, H.HS_NAME" 
					+ " FROM MEMBERS_COUPON M JOIN HS_COUPON S"
					+ " ON(M.HSC_NO = S.HSC_NO) JOIN HAIRSHOP H" 
					+ " ON(S.HS_NO = H.HS_NO)"
					+ " WHERE M.MEM_NO = ? AND M.MC_USED = 0 AND M.MC_EXPIREDATE >= sysdate"
					+ " ORDER BY M.MC_NO";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventVo.getMem_no());
//			pstmt.setString(2, eventVo.getMc_expiredate());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new MembersEventVo();
				resultVo.setMc_no(rs.getString("mc_no"));
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setMem_no(rs.getString("mem_no"));
				resultVo.setMc_issuedate(rs.getString("mc_issuedate"));
				resultVo.setMc_expiredate(rs.getString("mc_expiredate"));
				resultVo.setMc_used(rs.getString("mc_used"));
				resultVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				resultVo.setHsc_name(rs.getString("hsc_name"));
				resultVo.setHs_name(rs.getString("hs_name"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	} // end
	
	
	// 사용한 쿠폰리스트 뿌리기
	public ArrayList<MembersEventVo> memUsedCouponList(MembersEventVo eventVo) {
		ResultSet rs = null;
		MembersEventVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		ArrayList<MembersEventVo> list = new ArrayList<MembersEventVo>();
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT M.MC_NO, M.HSC_NO, M.MEM_NO, M.MC_ISSUEDATE, M.MC_EXPIREDATE, M.MC_USED,"
					+ " S.HSC_DISCOUNT_RATE, S.HSC_MAXDISCOUNT_PAY, S.HSC_NAME, H.HS_NAME"
					+ " FROM MEMBERS_COUPON M JOIN HS_COUPON S" 
					+ " ON(M.HSC_NO = S.HSC_NO) JOIN HAIRSHOP H"
					+ " ON(S.HS_NO = H.HS_NO)" 
					+ " WHERE M.MEM_NO = ? AND m.MC_USED = 1" 
					+ " ORDER BY M.MC_NO";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventVo.getMem_no());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new MembersEventVo();
				resultVo.setMc_no(rs.getString("mc_no"));
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setMem_no(rs.getString("mem_no"));
				resultVo.setMc_issuedate(rs.getString("mc_issuedate"));
				resultVo.setMc_expiredate(rs.getString("mc_expiredate"));
				resultVo.setMc_used(rs.getString("mc_used"));
				resultVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				resultVo.setHsc_name(rs.getString("hsc_name"));
				resultVo.setHs_name(rs.getString("hs_name"));
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return list;

	} // end
	
	
	// 보유중인 쿠폰리스트 뿌리기
	public MembersEventVo memCoupon(MembersEventVo eventVo) {
		ResultSet rs = null;
		MembersEventVo resultVo = null; // select할때는 리턴값이 필요해서 리턴값을 저장할 변수 선언
		try {
			conn = ConnectionManager.getConnnect();
			String sql = "SELECT M.MC_NO, M.HSC_NO, M.MEM_NO, M.MC_ISSUEDATE, M.MC_EXPIREDATE, M.MC_USED,"
					+ " S.HSC_DISCOUNT_RATE, S.HSC_MAXDISCOUNT_PAY, S.HSC_NAME, H.HS_NAME"
					+ " FROM MEMBERS_COUPON M JOIN HS_COUPON S" + " ON(M.HSC_NO = S.HSC_NO) JOIN HAIRSHOP H"
					+ " ON(S.HS_NO = H.HS_NO)" + " WHERE M.MEM_NO = ? AND M.MC_USED = 0 AND M.MC_EXPIREDATE >= ?"
					+ " ORDER BY M.MC_NO";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eventVo.getMem_no());
			pstmt.setString(2, eventVo.getMc_expiredate());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				resultVo = new MembersEventVo();
				resultVo.setMc_no(rs.getString("mc_no"));
				resultVo.setHsc_no(rs.getString("hsc_no"));
				resultVo.setMem_no(rs.getString("mem_no"));
				resultVo.setMc_issuedate(rs.getString("mc_issuedate"));
				resultVo.setMc_expiredate(rs.getString("mc_expiredate"));
				resultVo.setMc_used(rs.getString("mc_used"));
				resultVo.setHsc_discount_rate(rs.getString("hsc_discount_rate"));
				resultVo.setHsc_maxdiscount_pay(rs.getString("hsc_maxdiscount_pay"));
				resultVo.setHsc_name(rs.getString("hsc_name"));
				resultVo.setHs_name(rs.getString("hs_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(rs, pstmt, conn);
		}
		return resultVo;

	} // end
	
	
	
	//린아 타임끝
	
}
