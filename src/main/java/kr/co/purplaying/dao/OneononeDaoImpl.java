package kr.co.purplaying.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.OneononeDto;
import kr.co.purplaying.domain.SearchItem;

@Repository
public class OneononeDaoImpl implements OneononeDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.purplaying.dao.OneononeMapper.";
	
	@Override
	public OneononeDto select(Integer inquiry_no) throws Exception{
		return session.selectOne(namespace+"select",inquiry_no);
	}

	@Override
	public int insert(OneononeDto OneononeDto) throws Exception {
		return session.insert(namespace+"insert",OneononeDto);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+"count");
	}
	
/*
	@Override
	public int deleteAll() throws Exception {
		return session.delete(namespace+"deleteAll");
	}
*/

	@Override
	public List<OneononeDto> selectPage(Map map) throws Exception {
		return session.selectList(namespace+"selectPage",map);
	}

    @Override
    public int delete(Integer inquiry_no, String writer) throws Exception {
        Map map = new HashMap();
        map.put("inquiry_no", inquiry_no);
        map.put("writer", writer);
        return session.delete(namespace + "delete", map);
    }
    
    @Override
    public int update(OneononeDto oneononeDto) throws Exception {
        
        return session.update(namespace + "update", oneononeDto);
    }

    /*
     
    @Override
    public int searchResultCnt(SearchItem sc) throws Exception {
        
        return session.selectOne(namespace +"searchResultCnt", sc);
    }


    @Override
    public List<OneononeDto> searchSelectPage(SearchItem sc) throws Exception {
        
        return session.selectList(namespace + "searchSelectPage", sc);
    }
    
    */
    
/*
    @Override
    public int privateFalse(OneononeDto oneononeDto) throws Exception {
      return session.update(namespace+"privateFalse", oneononeDto);
    }
*/
    @Override
    public int updateAnsCnt(Integer inquiry_no, Integer inquiry_state) throws Exception {
      Map map = new HashMap();
      map.put("inquiry_state", inquiry_state);
      map.put("inquiry_no", inquiry_no);
      return session.update(namespace+"updateAnsCnt", map);
    }

 /*   
    @Override
    public OneononeDto selectAns(Integer inquiry_no) throws Exception {
      // TODO Auto-generated method stub
      return session.selectOne(namespace +"selectAns", inquiry_no);
    }
    */

}
