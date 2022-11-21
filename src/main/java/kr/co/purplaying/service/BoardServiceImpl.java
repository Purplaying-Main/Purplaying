package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.domain.BoardDto;
import kr.co.purplaying.domain.SearchItem;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<BoardDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectPage(map);
	}

	@Override
	public int getCount() throws Exception {
		return boardDao.count();
	}

	@Override
	public BoardDto read(int inquiry_no) throws Exception {
		BoardDto boardDto = boardDao.select(inquiry_no);

		return boardDto;
	}

  @Override
  public int remove(Integer inquiry_no, String user_id) throws Exception {
    // TODO Auto-generated method stub
    return boardDao.delete(inquiry_no,user_id);
  }

  @Override
  public int write(BoardDto boardDto) throws Exception {
      
      return boardDao.insert(boardDto);
//    throw new Exception();              // 예외상황 테스트
  }

  @Override
  public int modify(BoardDto boardDto) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.update(boardDto);
//    throw new Exception();              // 예외상황 테스트
  }

  @Override
  public int getSearchResultCnt(SearchItem sc) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.searchResultCnt(sc);
  }

  @Override
  public List<BoardDto> getSearchResultPage(SearchItem sc) throws Exception {
      // TODO Auto-generated method stub
      return boardDao.searchSelectPage(sc);
  }
	
	
}
