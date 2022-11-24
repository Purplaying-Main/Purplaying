package kr.co.purplaying.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.purplaying.dao.AnsDao;
import kr.co.purplaying.dao.OneononeDao;
import kr.co.purplaying.domain.AnsDto;
import kr.co.purplaying.domain.OneononeDto;

@Service
public class AnsServiceImpl implements AnsService{
	
	
	OneononeDao oneononeDao;
	AnsDao ansDao;
	

  public AnsServiceImpl(OneononeDao oneononeDao, AnsDao ansDao) {
    //super();
    this.oneononeDao = oneononeDao;
    this.ansDao = ansDao;
  }


  @Override
  public List<AnsDto> getList(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return ansDao.selectAll(inquiry_no);
  }


  @Override
  @Transactional(rollbackFor = Exception.class)
  public int remove(Integer ans_no, Integer inquiry_no, String admin_id) throws Exception {
    int rowCnt = oneononeDao.updateAnsCnt(inquiry_no, -1);
    System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
            
    rowCnt = ansDao.delete(ans_no, admin_id);
    System.out.println("rowCont = " + rowCnt);
    
    return rowCnt;
  }


  @Override
  @Transactional(rollbackFor = Exception.class)
  public int write(AnsDto ansDto) throws Exception {
    oneononeDao.updateAnsCnt(ansDto.getInquiry_no(), 1);
    return ansDao.insert(ansDto);
  }


  @Override
  public int modify(AnsDto ansDto) throws Exception {
    // TODO Auto-generated method stub
    return ansDao.update(ansDto);
  }


  @Override
  public AnsDto read(Integer ans_no) throws Exception {
    AnsDto ansDto = ansDao.select(ans_no);

    return ansDto;
  }


  @Override
  public AnsDto selectAnsData(Integer inquiry_no) throws Exception {
    // TODO Auto-generated method stub
    return ansDao.selectAnsData(inquiry_no);
  }


  @Override
  @Transactional(rollbackFor = Exception.class)
  public int insertAns(AnsDto ansDto) throws Exception {
    oneononeDao.updateAnsCnt(ansDto.getInquiry_no(), 1);
    return ansDao.insertAns(ansDto);
  }

  @Override
  @Transactional(rollbackFor = Exception.class)
  public int removeAns(Integer ans_no, Integer inquiry_no, String admin_id) throws Exception {
    int rowCnt = oneononeDao.updateAnsCnt(inquiry_no, -1);
    System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
            
    rowCnt = ansDao.deleteAns(ans_no, admin_id);
    System.out.println("rowCont = " + rowCnt);
    
    return rowCnt;
  }


  @Override
  public int modifyAns(AnsDto ansDto) throws Exception {
   
    return ansDao.modifyAns(ansDto);
  }


}

