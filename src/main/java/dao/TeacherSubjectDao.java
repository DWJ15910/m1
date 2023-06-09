package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.*;

public class TeacherSubjectDao {
	
	// 1) 강사 리스트 출력
	public ArrayList<HashMap<String,Object>> selTeacherCnt() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT teacher_no,teacher_name FROM teacher ORDER BY teacher_name";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		while(rs.next()){
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("강사번호",rs.getInt("teacher_no"));
			m.put("강사이름",rs.getString("teacher_name"));
			list.add(m);
		}
		return list;
	}
	
	// 2) 과목 리스트 출력
	public ArrayList<HashMap<String,Object>> setSubjectCnt() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT subject_no,subject_name FROM subject";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<HashMap<String,Object>> list2 = new ArrayList<HashMap<String,Object>>();
		while(rs.next()){
			HashMap<String,Object> m2 = new HashMap<String,Object>();
			m2.put("과목번호",rs.getInt("subject_no"));
			m2.put("과목이름",rs.getString("subject_name"));
			list2.add(m2);
		}
		return list2;
	}
	
	// 3) 담당과목 테이블 데이터 추가
	public int addTeacherSubject(TeacherSubject teachersubject) throws Exception {
		int cnt = 0;
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT COUNT(*) FROM teacher_subject WHERE teacher_no = ? AND subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,teachersubject.getTeacherNo());
		stmt.setInt(2,teachersubject.getSubjectNo());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt(1);
			System.out.println("중복된 담당과목-->" + cnt);
		}
		if(cnt==0) {
			String addTeacherSubjectSql = "INSERT INTO teacher_subject (teacher_no,subject_no,createdate,updatedate) VALUES (?,?,now(),now())";
			PreparedStatement addTeacherSubjectStmt = conn.prepareStatement(addTeacherSubjectSql);
			addTeacherSubjectStmt.setInt(1,teachersubject.getTeacherNo());
			addTeacherSubjectStmt.setInt(2,teachersubject.getSubjectNo());
			row = addTeacherSubjectStmt.executeUpdate();
			
			return row;
		}else {
			return 0;
		}
	}
	
	// 4) 강사-과목 수정
	public int updateTeacherSubject(TeacherSubject ts) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String updateSql = "UPDATE teacher_subject SET teacher_no=?,subject_no=?,updatedate=now() WHERE teacher_subject_no=?";
		PreparedStatement updateStmt = conn.prepareStatement(updateSql);
		updateStmt.setInt(1,ts.getTeacherNo());
		updateStmt.setInt(2,ts.getSubjectNo());
		updateStmt.setInt(3,ts.getTeacherSubjectNo());
		int row = updateStmt.executeUpdate();
		
		return row ;
	}
	// 5) 담당과목 리스트 수정
	public TeacherSubject selUpdateList(int teacherSubjectNo) throws Exception {
		TeacherSubject teachersubject = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String selUpdateListSql = "SELECT teacher_subject_no,teacher_no,subject_no,createdate,updatedate FROM teacher_subject WHERE teacher_subject_no = ?";
		PreparedStatement selUpdateListStmt = conn.prepareStatement(selUpdateListSql);
		selUpdateListStmt.setInt(1,teacherSubjectNo);
		ResultSet selUpdateListRs = selUpdateListStmt.executeQuery();
		
		if(selUpdateListRs.next()) {
			teachersubject = new TeacherSubject();
			teachersubject.setTeacherSubjectNo(selUpdateListRs.getInt("teacher_subject_no"));
			teachersubject.setTeacherNo(selUpdateListRs.getInt("teacher_no"));
			teachersubject.setSubjectNo(selUpdateListRs.getInt("subject_no"));
			teachersubject.setCreatedate(selUpdateListRs.getString("createdate"));
			teachersubject.setUpdatedate(selUpdateListRs.getString("updatedate"));
		}
		return teachersubject;
	}
	// 6) 강사-과목 리스트 나옴
		public ArrayList<HashMap<String,Object>> selTeacherSubject(int teacherNo) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "SELECT teacher_subject_no,s.subject_name FROM teacher_subject ts LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no WHERE teacher_no = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, teacherNo);
			ResultSet rs = stmt.executeQuery();
			
			ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()){
				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("과정번호",rs.getInt("teacher_subject_no"));
				m.put("과목이름",rs.getString("s.subject_name"));
				list.add(m);
			}
			return list;
		}
	// 7) 강사한명 지목
		public ArrayList<HashMap<String,Object>> selTeacherOne(int teacherSubjectNo) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "SELECT t.teacher_name FROM teacher_subject ts LEFT OUTER JOIN teacher t ON ts.teacher_no = t.teacher_no WHERE ts.teacher_subject_no=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, teacherSubjectNo);
			ResultSet rs = stmt.executeQuery();
			
			ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()){
				HashMap<String,Object> m = new HashMap<String,Object>();
				m.put("강사이름",rs.getString("t.teacher_name"));
				list.add(m);
			}
			return list;
		}
		
	// 8) TS 테이블 삭제
		public int removeTS(int teacherSubjectNo) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "DELETE FROM teacher_subject WHERE teacher_subject_no = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, teacherSubjectNo);
			int row = stmt.executeUpdate();
			
			return row;
		}
}
