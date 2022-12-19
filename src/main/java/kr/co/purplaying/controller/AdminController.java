package kr.co.purplaying.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AttachFileDto;
import kr.co.purplaying.domain.BannerFileDto;
import kr.co.purplaying.domain.PageResolver;
import kr.co.purplaying.domain.ProjectDto;
import kr.co.purplaying.domain.SearchItem;
import kr.co.purplaying.domain.UserDto;
import kr.co.purplaying.service.FileService;
import kr.co.purplaying.service.ProjectService;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@RequestMapping("/admin")
public class AdminController {
  
  @Autowired
  UserDao userDao;
  
  @Autowired
  ProjectService projectService;
  
  @Autowired
  FileService fileService;
  
  @Autowired
  private JavaMailSender mailSender;
  
  
  @GetMapping("/sendmessage")
  public String Adminsendmessage(SearchItem sc, HttpServletRequest request, Model m, HttpSession session ) {
    if(!session.getAttribute("user_role").equals(1)) {
      return null;
    }
    try {
      int totalCnt = userDao.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);
  
      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);
  
      List<UserDto> list = userDao.adminSelect(sc);
      System.out.println(list);
      m.addAttribute("UserList",list);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminsendmessage";
  }
  
  @GetMapping("/userlist")
  public String AdminUserList(SearchItem sc, HttpServletRequest request, Model m, HttpSession session ) {
    if(!session.getAttribute("user_role").equals(1)) {
      return null;
    }
    
    try {
      System.out.println(sc);
      int totalCnt = userDao.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);

      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);

      List<UserDto> list = userDao.adminSelect(sc);
      System.out.println(list);
      m.addAttribute("UserList",list);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminuserlist";
  }
  
  @GetMapping("/projectlist")
  public String AdminProjectList(SearchItem sc, HttpServletRequest request, Model m, HttpSession session ) {
    if(!session.getAttribute("user_role").equals(1)) {
      return null;
    }
    try {
      System.out.println(sc);
      int totalCnt = projectService.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);

      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);

      List<ProjectDto> projectList =projectService.selectProject(sc);
      m.addAttribute("projectList",projectList);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminprojectlist";
  }
  @GetMapping("/bannerlist")
  public String AdminBannerList(SearchItem sc, HttpServletRequest request, Model m, HttpSession session ) {
    if(!session.getAttribute("user_role").equals(1)) {
      return null;
    }
    try {
      List<BannerFileDto> bannerfileList = fileService.selectBannerList();
      System.out.println(sc);
      int totalCnt = fileService.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);

      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);
      System.out.println("totalCnt :"+totalCnt);
      List<ProjectDto> ProjectDtoList = projectService.selectProjectImgforAdmin(sc);
      m.addAttribute("ProjectDtoList",ProjectDtoList);
      m.addAttribute("bannerfileList",bannerfileList);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminbannerlist";
  }
  
  @GetMapping("/bannerupload")
  public String AdminBannerUpload(SearchItem sc, HttpServletRequest request, Model m, HttpSession session ) {
    if(!session.getAttribute("user_role").equals(1)) {
      return null;
    }
    try {
      List<BannerFileDto> bannerfileList = fileService.selectBannerList();
      System.out.println(sc);
      int totalCnt = fileService.getBannerSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);

      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);
//      System.out.println("totalCnt :"+totalCnt);
//      System.out.println("sc :"+ sc);
      List<AttachFileDto> banner_filelist = fileService.selectBanner_list(sc);
      List<AttachFileDto> fix_banner_filelist = new ArrayList<AttachFileDto>();
      for(int i=0 ; i<banner_filelist.size(); i++) {
//        System.out.println("banner_filelist[" +i+ "] : "+banner_filelist.get(i));
        if(i % 2 == 1) {
          fix_banner_filelist.add(banner_filelist.get(i));
        }
      }
//      for(int i=0 ; i<fix_banner_filelist.size(); i++) {
//        System.out.println("fix_banner_filelist[" +i+ "] : "+fix_banner_filelist.get(i));
//      }
      
      m.addAttribute("banner_filelist",fix_banner_filelist);
      m.addAttribute("bannerfileList",bannerfileList);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminbannerupload";
  }
  
  @PostMapping("/ShowBanner/{file_id}")
  @ResponseBody
  public String ShowBanner(@PathVariable int file_id , Model m, HttpSession session ) {
    System.out.println(file_id);
    try {
      AttachFileDto attachFileDto = fileService.findBannerByID(file_id);
      String file_src = attachFileDto.getFile_location().substring(7)+"\\"+attachFileDto.getFile_name();
      return file_src;
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
    
  @PostMapping("/listUser")
  @ResponseBody
  public Boolean AdminUserList(SearchItem sc, @RequestBody UserDto userDto, Model m, HttpSession session ) {
   
    try {
      if(userDao.updateRole(userDto) != 1) {
        System.out.println("권한 업데이트 실패");
      }
      return true;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return false;
    }
  }
  
  @PostMapping("/listProject")
  @ResponseBody
  public List<ProjectDto> AdminProjectList(SearchItem sc, @RequestBody ProjectDto projectDto , Model m, HttpSession session ) {
    try {
      if(projectService.deleteProject(projectDto.getPrdt_id())!=1) {
        System.out.println("프로젝트 삭제 실패");
      }
      List<ProjectDto> projectList =projectService.selectProject(sc);
      System.out.println(projectList);
      return projectList;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  //파일 보여주기/////////////////////////////////////////////////////////////////////////////////////////////////////////
  @GetMapping("/display")
  @ResponseBody
  public ResponseEntity<byte[]> getFile(String file_name, Model m ) throws Exception {
//    AttachFileDto attachFileDto = fileService.read(prdt_id);
//    m.addAttribute("attachFileDto", attachFileDto);
//    System.out.println("attachFileDto: "+attachFileDto);

    System.out.println("fileName : "+file_name);
    
    File file = new File("C:\\purplaying_file\\banner\\"+file_name);
    System.out.println("file: "+file);
    
    ResponseEntity<byte[]> result = null;
    System.out.println(file);
    try {
      HttpHeaders header = new HttpHeaders();
      header.add("Content-Type", Files.probeContentType(file.toPath()));
      result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
  
  //file upload////////////////////////////////////////////////////////////////////////////////////////////////
  @PostMapping(value = "/bannerupload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<List<AttachFileDto>> fileUpload(@RequestBody MultipartFile[] uploadFile, Model m){
    
    List<AttachFileDto> list = new ArrayList<>();
    
    System.out.println("upload file ajax post....");
    String uploadFolder ="C:\\purplaying_file\\Banner";
    
    String uploadFolderPath = getFolder();
  
    //make folder(yyyy/MM/dd)
    File uploadPath = new File(uploadFolder, uploadFolderPath);
    System.out.println("upload path: "+uploadPath);
    
    if(uploadPath.exists() == false) {
      uploadPath.mkdirs();
    }
    
    List<AttachFileDto> thumblist = new ArrayList();
    
    for (MultipartFile multipartFile : uploadFile) { 
      
      AttachFileDto attachFileDto = new AttachFileDto();
      String uploadFileName = multipartFile.getOriginalFilename();
      System.out.println("only file name: "+ uploadFileName);
      
      // 파일 경로, 이름 저장
      attachFileDto.setFile_name(uploadFileName);
      attachFileDto.setFile_location(uploadFolderPath);
      System.out.println("uploadFolderPath: "+uploadFolderPath);

//      파일명 중복방지 uuid
      UUID uuid = UUID.randomUUID();
      uploadFileName = uuid.toString() + "_" + uploadFileName;

      try {
        File saveFile = new File(uploadPath, uploadFileName);
        multipartFile.transferTo(saveFile);
        
        attachFileDto.setUuid(uuid.toString());
        attachFileDto.setUploadPath(uploadFolderPath);
        
        //원본 이미지 DB저장
        
        //썸네일 생성
        if(checkImageType(saveFile)) {
          attachFileDto.setImage(true);
          
          FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
          Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 230, 195); //width, height
          
          thumbnail.close();
        }
        // add to List
        list.add(attachFileDto);
        System.out.println("attachFileDto"+attachFileDto);
        
      } catch (Exception e) {
        e.printStackTrace();
      }  
    }//for
    return new ResponseEntity<>(list,HttpStatus.OK);
  }
  
  @PostMapping("/bannerimg/{position}")
  @ResponseBody
  public List<BannerFileDto> AdminBannerList(@RequestBody ProjectDto projectDto, @PathVariable int position , Model m, HttpSession session ) {
    try {
      System.out.println(projectDto);
      int prdt_id = projectDto.getPrdt_id();
      
      projectDto = fileService.findprojectImg(prdt_id);
      System.out.println(projectDto);
      
      projectDto.setPrdt_id(prdt_id);
      if(fileService.updateBannerFile(projectDto,position)!= 1) {
        System.out.println("배너 저장 실패");
      }
      List<BannerFileDto> bannerlist = fileService.selectBannerList();
      return bannerlist;
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  @PostMapping("/bannerByUpload/{position}")
  @ResponseBody
  public List<BannerFileDto> AdminBannerListByUpload(@RequestBody String imgsrc, @PathVariable int position , Model m, HttpSession session ) {
    try {
      if(fileService.updateBannerFileByUpload(imgsrc,position)!= 1) {
        System.out.println("배너 저장 실패");
      }
      List<BannerFileDto> bannerlist = fileService.selectBannerList();
      return bannerlist;
      
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  ///삭제//////////////////////////////////////////////////////////////////////ㅍ
  @PostMapping("/removeFile")
  @ResponseBody
  public ResponseEntity<Boolean> removeFile(String uploadPath, String fileName){
      System.out.println("path:"+uploadPath+" name :"+fileName);
      String srcFileName = null;
      try{
          srcFileName = URLDecoder.decode(fileName,"UTF-8");
          //UUID가 포함된 파일이름을 디코딩해줍니다.
          File file = new File(uploadPath +File.separator + srcFileName);
          boolean result = file.delete();

          File thumbnail = new File(file.getParent(),"s_"+file.getName());
          //getParent() - 현재 File 객체가 나태내는 파일의 디렉토리의 부모 디렉토리의 이름 을 String으로 리턴해준다.
          result = thumbnail.delete();
          return new ResponseEntity<>(result,HttpStatus.OK);
      }catch (UnsupportedEncodingException e){
          e.printStackTrace();
          return new ResponseEntity<>(false,HttpStatus.INTERNAL_SERVER_ERROR);
      }
  }
  @PostMapping("/bannersavedb")
  @ResponseBody
  public ResponseEntity<Boolean> saveFiledb(String uploadPath, String fileName, String fileuuid) throws Exception{
      System.out.println("path:"+uploadPath+" name :"+fileName+"uuid : "+fileuuid);
      String srcFileName = null;
      try{
          srcFileName = URLDecoder.decode(fileuuid+fileName,"UTF-8");
          //UUID가 포함된 파일이름을 디코딩해줍니다.
          
          Path path = Paths.get("C:\\purplaying_file\\"+uploadPath+'\\'+fileuuid+fileName);
          long uploadFileSize = Files.size(path);
          System.out.println("uploadFileSize : "+uploadFileSize);
          if(fileService.insertbannerFile(uploadPath, srcFileName, uploadFileSize) != 1) {
            System.out.println("insertFile ERR");
          }

          String thumbnail = (String)("s_" + srcFileName);
          Path paththumbnail = Paths.get("C:\\purplaying_file\\"+uploadPath+'\\'+"s_"+fileuuid+fileName);
          long uploadFileSizethumbnail = Files.size(paththumbnail);
          if(fileService.insertbannerFile(uploadPath, thumbnail, uploadFileSizethumbnail) != 1) {
            System.out.println("insertFile ERR");
          }
         
          return new ResponseEntity<>(HttpStatus.OK);
      }catch (UnsupportedEncodingException e){
          e.printStackTrace();
          return new ResponseEntity<>(false,HttpStatus.INTERNAL_SERVER_ERROR);
      }
  }
  
  @PostMapping("/tousermail")
  @ResponseBody
  public void sendMailTest(@RequestBody UserDto userDto) throws Exception{ 
      System.out.println(userDto);
      Random random = new Random();
      int checkNum = random.nextInt(888888) + 111111;
      userDto.setUser_pwd(String.valueOf(checkNum));
      System.out.println(userDto);
      if(userDao.updateUserPwd(userDto)!=1)
      {
        System.out.println("비밀번호 변경오류");
        return ;
      }
      
      String subject = "퍼플레잉 비밀번호찾기";
      String content = "임시 비밀번호 : " + checkNum ;
      String from = "purplayingcorp@gmail.com";
      String to = userDto.getUser_id();
      
      try {
          MimeMessage mail = mailSender.createMimeMessage();
          MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
          // true는 멀티파트 메세지를 사용하겠다는 의미
          
          /*
           * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
           * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
           */
          
          mailHelper.setFrom(from);
          // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
          // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
          //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
          mailHelper.setTo(to);
          mailHelper.setSubject(subject);
          mailHelper.setText("<h2>"+content+ "</h2>", true);
          // true는 html을 사용하겠다는 의미입니다.
          
          /*
           * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
           */
          
          mailSender.send(mail);
          
      } catch(Exception e) {
          e.printStackTrace();
      }
      
  }
  
  @PostMapping("/pageselect")
  @ResponseBody
  public Map pageSelect(@RequestBody SearchItem sc, HttpServletRequest request, HttpSession session ) {
    System.out.println(sc);
    Map map = new HashMap();
    try {
      int totalCnt = userDao.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);
      
      List<UserDto> list = userDao.adminSelect(sc);
      map.put("totalCnt", totalCnt);
      map.put("pr", pageResolver);
      map.put("UserList",list);
      map.put("length", 3);
      
     
      System.out.println(list);
     
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return map;
  }
  
  
  private boolean checkImageType(File file) {
    try {
      String contentType = Files.probeContentType(file.toPath());
      
      return contentType.startsWith("image");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }
  
  //날짜별 폴더 생성 
  private String getFolder() {
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String str = sdf.format(date);
    
    return str.replace("-", File.separator);
  }
  
}
