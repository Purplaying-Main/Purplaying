package kr.co.purplaying.service;

import java.util.List;
import java.util.Map;

import kr.co.purplaying.domain.NoticeDto;

public interface NoticeService {
    
    List<NoticeDto> getPage(Map map) throws Exception;
    
    public int getCount() throws Exception;
   
    NoticeDto read(Integer notice_id) throws Exception;

    int remove(Integer notice_id, String writer) throws Exception;

    int write(NoticeDto noticeDto) throws Exception;

    int modify(NoticeDto noticeDto) throws Exception;

    int privateFalse(NoticeDto noticeDto) throws Exception;
}
