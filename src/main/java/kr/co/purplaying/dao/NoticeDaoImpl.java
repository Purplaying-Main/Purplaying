package kr.co.purplaying.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.purplaying.dao.NoticeMapper.";
	
	@Override
	public NoticeDto select(Integer notice_id) throws Exception{
		return session.selectOne(namespace+"select",notice_id);
	}

	@Override
	public int insert(NoticeDto dto) throws Exception {
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
	public List<NoticeDto> selectPage(Map map) throws Exception {
		return session.selectList(namespace+"selectPage",map);
	}

	@Override
	public int increaseViewCnt(int notice_id) throws Exception {
		return session.update(namespace+"increaseViewCnt",notice_id);
	}

}
