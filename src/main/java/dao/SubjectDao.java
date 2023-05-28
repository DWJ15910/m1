package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.*;

public class SubjectDao {
	
	//DBUtil conn 호출
	
	
	// 1) 과목목록
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		ArrayList<Subject> list = new ArrayList<>();
		
		String selectSubjectListByPageSql = "SELECT subject_no,subject_name,subject_time,createdate,updatedate FROM subject LIMIT ?, ?";
		PreparedStatement selectSubjectListByPageStmt = conn.prepareStatement(selectSubjectListByPageSql);
		selectSubjectListByPageStmt.setInt(1, beginRow);
		selectSubjectListByPageStmt.setInt(2, rowPerPage);
		ResultSet selectSubjectListByPageRs = selectSubjectListByPageStmt.executeQuery();
		
		while(selectSubjectListByPageRs.next()){
			Subject s = new Subject();
			s.setSubjectNo(selectSubjectListByPageRs.getInt("subject_no"));
			s.setSubjectName(selectSubjectListByPageRs.getString("subject_name"));
			s.setSubjectTime(selectSubjectListByPageRs.getInt("subject_time"));
			s.setCreatedate(selectSubjectListByPageRs.getString("createdate"));
			s.setUpdatedate(selectSubjectListByPageRs.getString("updatedate"));
			list.add(s);
		}
		
		return list;
	}
	
	// 2) 과목추가
	public int insertSubject(Subject subject) throws Exception {
		int row = 0;
		int cnt = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT count(*) FROM subject WHERE subject_name = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,subject.getSubjectName());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		if(cnt==0) {
			String insertSubjectSql = "INSERT INTO subject (subject_name,subject_time,createdate,updatedate) VALUES (?,?,now(),now())";
			PreparedStatement insertSubjectStmt = conn.prepareStatement(insertSubjectSql);
			insertSubjectStmt.setString(1,subject.getSubjectName());
			insertSubjectStmt.setInt(2,subject.getSubjectTime());
			row = insertSubjectStmt.executeUpdate();
			
			return row;
		} else {
			return 0;
		}
	}
	// 3) 과목삭제
	public int deleteSubject(int subjectNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String deleteSubjectSql = "DELETE FROM subject WHERE subject_no = ?";
		PreparedStatement deleteSubjectStmt = conn.prepareStatement(deleteSubjectSql);
		deleteSubjectStmt.setInt(1, subjectNo);
		row = deleteSubjectStmt.executeUpdate();
		
		return row;
		
	}
	// 4) 과목수정
	public int updateSubject(Subject subject) throws Exception{
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String updateSubjectSql = "UPDATE subject set subject_name=?,subject_time=?,updatedate=now() WHERE subject_no=?";
		PreparedStatement updateSubjectStmt = conn.prepareStatement(updateSubjectSql);
		updateSubjectStmt.setString(1, subject.getSubjectName());
		updateSubjectStmt.setInt(2, subject.getSubjectTime());
		updateSubjectStmt.setInt(3, subject.getSubjectNo());
		row = updateSubjectStmt.executeUpdate();
		return row;
	}
	// 5) 과목 하나 상세
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String selectSubjectOneSql = "SELECT subject_no,subject_name,subject_time,createdate,updatedate FROM subject WHERE subject_no = ?";
		PreparedStatement selectSubjectOneStmt = conn.prepareStatement(selectSubjectOneSql);
		selectSubjectOneStmt.setInt(1, subjectNo);
		ResultSet selectSubjectOneRs = selectSubjectOneStmt.executeQuery();
		
		if (selectSubjectOneRs.next()) {
	        subject = new Subject();
	        subject.setSubjectNo(selectSubjectOneRs.getInt("subject_no"));
	        subject.setSubjectName(selectSubjectOneRs.getString("subject_name"));
	        subject.setSubjectTime(selectSubjectOneRs.getInt("subject_time"));
	        subject.setCreatedate(selectSubjectOneRs.getString("createdate"));
	        subject.setUpdatedate(selectSubjectOneRs.getString("updatedate"));
	    }
		
		return subject;
	}
	
	// 6) 과목전체row
	public int selectSubjectCnt() throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String selectSubjectCntSql = "SELECT COUNT(*) FROM subject";
		PreparedStatement selectSubjectCntStmt = conn.prepareStatement(selectSubjectCntSql);
		ResultSet selectSubjectCntRs = selectSubjectCntStmt.executeQuery();
		
		if(selectSubjectCntRs.next()) {
			row = selectSubjectCntRs.getInt(1);
		}
		
		return row;
	}
}
