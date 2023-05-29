package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.*;

public class TeacherDao {
	// 1) 강사리스트와 담당과목 출력
	// teacher 테이블을 기준으로 teacher_subject 테이블에 없어도 나오도록 설정
	// 담당과목이 없을 경우 "없음" 출력
	public ArrayList<HashMap<String,Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT t.teacher_no, t.teacher_id,t.teacher_name,IFNULL(GROUP_CONCAT(s.subject_name),'') tsubject FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no GROUP BY t.teacher_no,t.teacher_id,t.teacher_name limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		while(rs.next()){
			HashMap<String,Object> m = new HashMap<String,Object>();
			m.put("강사번호",rs.getInt("t.teacher_no"));
			m.put("강사아이디",rs.getString("t.teacher_id"));
			m.put("강사이름",rs.getString("t.teacher_name"));
			m.put("담당과목",rs.getString("tsubject"));
			list.add(m);
		}
		return list;
	}
	
	// 2) 강사 테이블 전체 행의 수 출력
	public int selectTeacherCount() throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String selectTeacherTotalSql = "SELECT COUNT(*) FROM teacher";
		PreparedStatement selectTeacherTotalStmt = conn.prepareStatement(selectTeacherTotalSql);
		ResultSet selectTeacherTotalRs = selectTeacherTotalStmt.executeQuery();
		
		if(selectTeacherTotalRs.next()) {
			row = selectTeacherTotalRs.getInt(1);
		}
		
		return row;
	}
	
	// 3) 강사추가
	public int addTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String insertSubjectSql = "INSERT INTO teacher (teacher_id,teacher_name,teacher_history,createdate,updatedate) VALUES (?,?,?,now(),now())";
			PreparedStatement insertSubjectStmt = conn.prepareStatement(insertSubjectSql);
			insertSubjectStmt.setString(1,teacher.getTeacherId());
			insertSubjectStmt.setString(2,teacher.getTeacherName());
			insertSubjectStmt.setString(3,teacher.getTeacherHistory());
			row = insertSubjectStmt.executeUpdate();
			
			return row;
		}
	
	// 4) 강사 상세보기
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String oneSql = "SELECT t.teacher_no, t.teacher_id,t.teacher_name,t.teacher_history,t.createdate,t.updatedate,ifnull(GROUP_CONCAT(s.subject_name),'') tsubject FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no WHERE t.teacher_no = ?";
		PreparedStatement oneStmt = conn.prepareStatement(oneSql);
		oneStmt.setInt(1,teacherNo);
		ResultSet oneRs = oneStmt.executeQuery();
		
		if(oneRs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(oneRs.getInt("t.teacher_no"));
			teacher.setTeacherId(oneRs.getString("t.teacher_id"));
			teacher.setTeacherName(oneRs.getString("t.teacher_name"));
			teacher.setTeacherHistory(oneRs.getString("t.teacher_history"));
			teacher.setCreatedate(oneRs.getString("t.createdate"));
			teacher.setUpdatedate(oneRs.getString("t.updatedate"));
			teacher.setSubject(oneRs.getString("tsubject"));
		}
		return teacher;
	}

	// 5) 강사 수정
	public int updateTeacher(Teacher teacher) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String updateSql = "UPDATE teacher SET teacher_id=?,teacher_name=?,teacher_history=?,updatedate=now() WHERE teacher_no=?";
		PreparedStatement updateStmt = conn.prepareStatement(updateSql);
		updateStmt.setString(1,teacher.getTeacherId());
		updateStmt.setString(2,teacher.getTeacherName());
		updateStmt.setString(3,teacher.getTeacherHistory());
		updateStmt.setInt(4,teacher.getTeacherNo());
		int row = updateStmt.executeUpdate();
		
		return row ;
	}
	
	// 6) 강사 삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String delSql = "DELETE FROM teacher WHERE teacher_no=?";
		PreparedStatement delStmt = conn.prepareStatement(delSql);
		delStmt.setInt(1,teacherNo);
		int row = delStmt.executeUpdate();
		
		return row;
	}
	
	
	
	
	
	
	
	
	
}
