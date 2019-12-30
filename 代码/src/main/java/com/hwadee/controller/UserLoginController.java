package com.hwadee.controller;

import com.hwadee.model.UserList;
import com.hwadee.service.UserListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/user")
@SessionAttributes("UserList")
public class UserLoginController {

    @Resource
    private UserListService userListService;

    @GetMapping("/login")
    public String login(){
        return "login";}

    @RequestMapping("/main")
    public String main(HttpServletRequest request,Model model)throws Exception{

        UserList userList = new UserList();
        String userId = request.getParameter("userID");
        userList = userListService.findByID(userId);
        model.addAttribute("UserList", userList);
        return "main";
    }

    @PostMapping("/log")
    public String save(@ModelAttribute("user") UserList user, Model model, HttpServletRequest request)throws Exception{
        if(userListService.checkLogin(user)==true){
            int i = 0;
            model.addAttribute("i",i);
            UserList UserDemo=userListService.getUser(user);
            request.getSession().setAttribute("test",UserDemo);
            model.addAttribute("UserList",UserDemo);
            return "redirect:/user/main";
        }
        else{
            int i = 1;
            model.addAttribute("i",i);
            return "login";
        }
    }

    @RequestMapping("/ChangeMessage")
    public String chMess(@ModelAttribute("UserList") UserList mode,Model model)throws Exception{
        model.addAttribute("UserList",mode);
        return "changeMessage";
    }

    @RequestMapping("/change")
    public String ChangeInfo(@ModelAttribute("UserList") UserList mode,HttpServletRequest request,Model model)throws Exception{
        UserList newlist = new UserList();
        String pw = request.getParameter("password");
        String addr=request.getParameter("address");
        String phone =request.getParameter("phoneNum");

        //无法修改
        newlist.setUserType(mode.getUserType());
        newlist.setUserId(mode.getUserId());
        newlist.setName(mode.getName());
        newlist.setPicUrl(mode.getPicUrl());//暂时不能修改

        if(!pw.equals(null)){
            newlist.setPassword(pw);
        }
        if(!addr.equals(null)){
            newlist.setAddress(addr);
        }
        if(!phone.equals(null)){
            newlist.setPhoneNum(phone);
        }


        userListService.update(newlist);

        model.addAttribute("UserList",userListService.getUser(newlist));

        return "redirect:/user/message";
    }

    @RequestMapping("/message")
    public String Message(@ModelAttribute("UserList") UserList mode,Model model){
        model.addAttribute("UserList",mode);
        return "Message";
    }

    @RequestMapping("/upload")
    public String getUpload(){
        return "upload";
    }

    @RequestMapping("/fileUploadPage")
    public String upload(@ModelAttribute("UserList") UserList userList, HttpServletRequest request, Model model, MultipartFile file) throws Exception{
        //保存数据库的路径
        String sqlpath=null;
        //定义文件保存的本地路径
        String localpath="C:\\Users\\59150\\Desktop\\hwadee\\hwadee-project\\target\\hwadee-project\\image\\";
        //定义文件名
        String filename=null;
        if(!file.isEmpty()){
            //生成文件名
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型
            String filetype=file.getContentType();
            //获得文件后缀
            String suffix=filetype.substring(filetype.indexOf("/")+1);
            //得到文件名
            filename=uuid+"."+suffix;
            //文件保存路径
            file.transferTo(new File(localpath+filename));
        }
        sqlpath="/image/"+filename;
        userList.setPicUrl(sqlpath);
        userListService.update(userList);
        model.addAttribute("localpath",localpath);
        model.addAttribute("sqlpath",sqlpath);
        model.addAttribute("filename",filename);
        model.addAttribute("UserList",userList);
        return "redirect:/user/message";
    }

    @RequestMapping("addfunction")
    public String addUser(String userID,String uname,String userType,String password1,String password2,String address,String phoneNum,HttpServletRequest request,Model model) throws Exception{
        if(!password1.equals(password2)){
            return "wrong";
        }
        else {
            UserList userList = new UserList();
            userList.setPassword(password1);
            userList.setUserId(userID);
            userList.setAddress(address);
            userList.setPhoneNum(phoneNum);
            userList.setName(uname);
            userList.setUserType(userType);
            userListService.insert(userList);
        }
        return "redirect:/admin/worker";
    }

    @RequestMapping("add")
    public String addUI(@ModelAttribute("UserList") UserList userList){
        if(userList.getUserType().equals("管理人员")) {
            return "addUser";
        }
        else {
            return "redirect:/admin/admin";
        }
    }


}
