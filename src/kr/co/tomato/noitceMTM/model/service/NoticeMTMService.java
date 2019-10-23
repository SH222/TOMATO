package kr.co.tomato.noitceMTM.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.co.tomato.common.JDBCTemplate;
import kr.co.tomato.noitceMTM.model.dao.NoticeMTMDao;
import kr.co.tomato.noitceMTM.model.vo.NoticeMTM;

public class NoticeMTMService {

	public int insertNoticeMTM(NoticeMTM mtm) {
		Connection conn = JDBCTemplate.getConnection();
		
		NoticeMTMDao dao = new NoticeMTMDao();
		int result = dao.insertNoticeMTM(conn, mtm);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<NoticeMTM> noticeMTMAdmin() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		NoticeMTMDao dao = new NoticeMTMDao();
		
		ArrayList<NoticeMTM> list = dao.noticeMTMAdmin(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public int NoticeMTMAdminInsert(String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		NoticeMTMDao dao = new NoticeMTMDao();
		int result = dao.NoticeMTMAdminInsert(content, conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
