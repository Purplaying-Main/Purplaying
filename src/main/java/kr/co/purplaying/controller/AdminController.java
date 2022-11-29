package kr.co.purplaying.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.purplaying.dao.UserDao;
import kr.co.purplaying.domain.AttachFileDto;
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
      System.out.println(sc);
      int totalCnt = fileService.getSearchResultCnt(sc);
      
      PageResolver pageResolver= new PageResolver(totalCnt, sc);

      m.addAttribute("totalCnt", totalCnt);
      m.addAttribute("pr", pageResolver);

      List<AttachFileDto> bannerList =fileService.selectFileListforAdmin(sc);
      m.addAttribute("bannerList",bannerList);
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return "adminbannerlist";
  }
   
  @PostMapping("/listUser")
  @ResponseBody
  public List<UserDto> AdminUserList(SearchItem sc, @RequestBody UserDto userDto, Model m, HttpSession session ) {
   
    try {
      if(userDao.updateRole(userDto) != 1) {
        System.out.println("권한 업데이트 실패");
      }
      List<UserDto> list = userDao.adminSelect(sc);
      
      return list;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return null;
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
      return projectList;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
  
  //upload////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @GetMapping("/displayAdmin")
  @ResponseBody
  public ResponseEntity<byte[]> getFile(String file_name , Integer prdt_id, Model m ) throws Exception {
    
//      AttachFileDto attachFileDto = fileService.read(prdt_id);
//      m.addAttribute("attachFileDto", attachFileDto);
//      System.out.println("attachFileDto: "+attachFileDto);
    
    System.out.println("fileName : "+file_name);
    
    File file = new File("C:\\purplaying_file\\"+file_name);
    System.out.println("file: "+file);
    
    ResponseEntity<byte[]> result = null;
    
    try {
      
      HttpHeaders header = new HttpHeaders();
      header.add("Content-Type", Files.probeContentType(file.toPath()));
      result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
  
  //이미지 파일 판단
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
  
  //admin 카로셀 이미지 업로드
  @PostMapping(value = "/adminUpload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  @ResponseBody
  public ResponseEntity<List<AttachFileDto>> fileUpload(MultipartFile[] uploadFile, Model m){
    
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

      
      
//        파일명 중복방지 uuid
      UUID uuid = UUID.randomUUID();
      uploadFileName = uuid.toString() + "_" + uploadFileName;

      try {
        File saveFile = new File(uploadPath, uploadFileName);
        multipartFile.transferTo(saveFile);
        
        attachFileDto.setUuid(uuid.toString());
        attachFileDto.setUploadPath(uploadFolderPath);
        
        //원본 이미지 DB저장
        
         long uploadFileSize = multipartFile.getSize();
         imgToDB(uploadFolderPath, uploadFileName, uploadFileSize);
         
         
        //썸네일 생성
        if(checkImageType(saveFile)) {
          attachFileDto.setImage(true);
          
          FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
          Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 230, 195); //width, height
          //썸네 이미지 DB저장
        
          long uploadFileSize_tumb = multipartFile.getSize();
          String uploadFileName_tumb = "s_"+uploadFileName;
          imgToDB(uploadFolderPath, uploadFileName_tumb, uploadFileSize_tumb);
          
          
          thumbnail.close();
        }
        // add to List
        list.add(attachFileDto);
        
      } catch (Exception e) {
        e.printStackTrace();
      }  
    }//for
    return new ResponseEntity<>(list,HttpStatus.OK);
  }
  
  private void imgToDB(String uploadFolderPath, String uploadFileName, long uploadFileSize) throws Exception {
    if( fileService.insertMainFile(uploadFolderPath, uploadFileName, uploadFileSize) != 1) {
      System.out.println("insertFile ERR");
    }
  }

}
