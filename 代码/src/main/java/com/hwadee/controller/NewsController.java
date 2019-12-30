package com.hwadee.controller;

import com.hwadee.model.NewsList;
import com.hwadee.model.UserList;
import com.hwadee.service.NewsListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("UserList")
@RequestMapping("/news")
public class NewsController {

    @Resource
    private NewsListService newsListService;

    @RequestMapping("/news")
    public String news(Model model) throws Exception {
        return "news";
    }

    @RequestMapping("newshow")
    public String show(@ModelAttribute("UserList") UserList userList, Model model) throws Exception {
        List<NewsList> newsLists = newsListService.findAll();
        model.addAttribute("UserList", userList);
        model.addAttribute("newsLists", newsLists);
        return "temp-news";
    }

    @RequestMapping("manage")
    public String manageNews(@ModelAttribute("UserList") UserList userList, Model model) throws Exception {
        model.addAttribute("UserList", userList);
        if (userList.getUserType().equals("管理人员")) {
            return "newsmanage";
        } else {
            return "redirect:/news/news";
        }
    }

    @RequestMapping("insert")
    public String getInsert(){
        return "newspublish";
    }

    @RequestMapping("insertfunction")
    public String InsertNews(String newscontent,String newsType,HttpServletRequest request) throws Exception {
        NewsList newsList = new NewsList();
        SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String newsTime = nowtime.format(new Date());
        newsList.setNewsContent(newscontent);
        newsList.setNewsTime(newsTime);
        newsList.setNewsType(newsType);
        newsListService.insert(newsList);
        return "redirect:/news/newshow";
    }

    @RequestMapping("delete")
    public String getDelete(Model model) throws Exception{
        List<NewsList> newsLists = newsListService.findAll();
        model.addAttribute("newsLists",newsLists);
        return "newsdelete";
    }

    @RequestMapping("deletefunction")
    public String DeleteNews(String newsId, HttpServletRequest request) throws Exception {
        int newsID = Integer.parseInt(newsId);
        newsListService.delete(newsID);
        System.out.println(newsId);
        return "redirect:/news/delete";
    }

//    @RequestMapping("update")
//    public String UpdateNews(HttpServletRequest request) throws Exception {
//        NewsList newsList = new NewsList();
//        String newsID1 = request.getParameter("newsId");
//        int newsID = Integer.parseInt(newsID1);
//        NewsList oldNewsList = newsListService.findByID(newsID);
//        newsList.setNewsId(newsID);
//        String newscontent = request.getParameter("newscontent");
//        String newsType = request.getParameter("newsType");
//        if (newsType.equals(null)) {
//            newsList.setNewsType(oldNewsList.getNewsType());
//        }
//        if (newscontent.equals(null)) {
//            newsList.setNewsContent(oldNewsList.getNewsContent());
//        }
//        SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String newsTime = nowtime.format(new Date());
//        newsList.setNewsTime(newsTime);
//        newsListService.update(newsList);
//        return "redirect:/news/news";
//    }

}
