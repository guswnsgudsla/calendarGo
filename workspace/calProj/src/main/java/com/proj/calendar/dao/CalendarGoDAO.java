package com.proj.calendar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.proj.calendar.vo.CalendarGoVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CalendarGoDAO {

	private static final String NAMESPACE = "com.proj.calendar.dao.CalendarGoDAO";
	private final SqlSession sqlSession;

	public List<CalendarGoVO> selectCalendarGoList(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.selectCalendarGoList
		return sqlSession.selectList(NAMESPACE + ".selectCalendarGoList", calendarGoVO);
	}
	
	public int insertCalendarGo(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.insertCalendarGo
		return sqlSession.insert(NAMESPACE + ".insertCalendarGo", calendarGoVO);
	}
	
	public int editCalendarGo(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.editCalendarGo
		return sqlSession.update(NAMESPACE + ".editCalendarGo", calendarGoVO);
	}
	
	public int deleteCalendarGo(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.deleteCalendarGo
		return sqlSession.update(NAMESPACE + ".deleteCalendarGo", calendarGoVO);
	}
	
	public CalendarGoVO selectAnvYn(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.selectAnvYn
		return sqlSession.selectOne(NAMESPACE + ".selectAnvYn", calendarGoVO);
	}
	
	public CalendarGoVO selectAnvYnList(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.selectAnvYnList
		return sqlSession.selectOne(NAMESPACE + ".selectAnvYnList", calendarGoVO);
	}
	
	public int deleteAnvYn(CalendarGoVO calendarGoVO) {
		//calendarGoDAO.deleteAnvYn
		return sqlSession.delete(NAMESPACE + ".deleteAnvYn", calendarGoVO);
	}
}