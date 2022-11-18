package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.SearchItem;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.purplaying.dao.BoardMapper.";
	
	@Override
	public BoardDto select(Integer inquiry_no) throws Exception{
		return session.selectOne(namespace+"select",inquiry_no);
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
    public int delete(Integer inquiry_no, String user_id) throws Exception {
        Map map = new HashMap();
        map.put("inquiry_no", inquiry_no);
        map.put("user_id", user_id);
        return session.delete(namespace + "delete", map);
    }
    
    @Override
    public int update(BoardDto boardDto) throws Exception {
        
        return session.update(namespace + "update", boardDto);
    }

    @Override
    public int searchResultCnt(SearchItem sc) throws Exception {
        
        return session.selectOne(namespace +"searchResultCnt", sc);
    }


    @Override
    public List<BoardDto> searchSelectPage(SearchItem sc) throws Exception {
        
        return session.selectList(namespace + "searchSelectPage", sc);
    }

}
