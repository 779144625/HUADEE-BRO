package com.hwadee.controller;

import com.hwadee.model.CommentList;
import com.hwadee.model.UserList;
import com.hwadee.service.CommentListService;
import com.hwadee.service.UserListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("UserList")
@RequestMapping("/comments")
public class CommentListController {

    private static Logger logger = LoggerFactory.getLogger(CommentListController.class);

    @Resource
    private CommentListService commentListService;

    @Resource
    private UserListService userListService;

    @RequestMapping("/select")
    public String selectComment(@ModelAttribute("UserList")UserList userList, Model model, HttpServletRequest request)throws Exception{

        model.addAttribute("UserList",userList);

        return "commentselect";
    }

    @RequestMapping("/manage")
    public String manageComment(@ModelAttribute("UserList")UserList userList,Model model, HttpServletRequest request)throws Exception{

        model.addAttribute("UserList",userList);
        List<CommentList> commentLists = commentListService.findAll();
        model.addAttribute("allComments", commentLists);
        if(userList.getUserType().equals("管理人员")) {
            return "commentmanage";
        }
        else {
            return "redirect:/comments/select";
        }

    }

    @RequestMapping("/showcomments")
    public String ShowComments(@ModelAttribute("UserList")UserList userList,Model model,HttpServletRequest request) throws Exception{

        model.addAttribute("UserList",userList);

        List<CommentList> commentLists = commentListService.findAll();
        model.addAttribute("allComments", commentLists);
        return "showcomments";

    }

    @RequestMapping("/dianzan")
    public String Dianzan(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model) throws Exception{

        model.addAttribute("UserList",userList);

        String commentId1 = request.getParameter("id");
        int commentId = Integer.parseInt(commentId1);

        logger.debug("222222222222222222");
        logger.debug(commentId1);

        CommentList commentList = commentListService.findByID(commentId);
        int a = commentList.getIfSatisfied();
        int b=a+1;
        commentList.setIfSatisfied(b);
        logger.debug(commentList.toString());
        logger.debug(commentList.getIfSatisfied()+"");
        commentListService.update(commentList);
        List<CommentList> commentLists = commentListService.findAll();
        model.addAttribute("allComments", commentLists);
        return "redirect:/comments/showcomments";
    }

    @RequestMapping("newcomment")
    public String NewComment(@ModelAttribute("UserList")UserList userList,CommentList commentList, HttpServletRequest request,Model model) throws Exception {

        model.addAttribute("UserList",userList);

        SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String commentTime = nowtime.format(new Date());
        String getcomment = request.getParameter("comment");
        commentList.setUserId(userList.getUserId());
        commentList.setCommentContent(getcomment);
        commentList.setIfSatisfied(0);
        commentList.setCommentTime(commentTime);

        logger.debug(commentList.getUserId());

        commentListService.insert(commentList);
        List<CommentList> commentLists = commentListService.findAll();
        model.addAttribute("allComments", commentLists);
        return "redirect:/comments/showcomments";
    }

    @RequestMapping("delete")
    public String deleteComment(@ModelAttribute("UserList")UserList userList, HttpServletRequest request,Model model)throws Exception{

        model.addAttribute("UserList",userList);

        String commentId1 = request.getParameter("id");
        int commentId = Integer.parseInt(commentId1);
        commentListService.delete(commentId);
        List<CommentList> commentLists = commentListService.findAll();
        model.addAttribute("allComments", commentLists);

        return "redirect:/comments/manage";
    }
}
