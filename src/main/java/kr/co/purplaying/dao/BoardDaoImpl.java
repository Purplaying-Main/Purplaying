package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.purplaying.dao.BoardMapper.";
	
	@Override
	public BoardDto select(Integer bno) throws Exception{
		return session.selectOne(namespace+"select",bno);
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		return session.insert(namespace+"insert",dto);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+"count");
	}

	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace+"deleteAll");
	}

	@Override
	public List<BoardDto> selectPage(Map<String, Integer> map) throws Exception {
		return session.selectList(namespace+"selectPage",map);
	}

	@Override
	public int increaseViewCnt(int bno) throws Exception {
		return session.update(namespace+"increaseViewCnt",bno);
	}

}
