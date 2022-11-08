package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.purplaying.dao.BoardDao;
import kr.co.purplaying.domain.BoardDto;

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
	public BoardDto read(int bno) throws Exception {
		BoardDto boardDto = boardDao.select(bno);
		//비즈니스 로직 추가
		boardDao.increaseViewCnt(bno);
		return boardDto;
	}
	
	
}
