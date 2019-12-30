package com.hwadee.controller;

import org.apache.log4j.Logger;
import com.hwadee.model.StaffList;
import com.hwadee.model.UserList;
import com.hwadee.service.StaffListService;
import com.hwadee.service.UserListService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Enzo Cotter on 2019/8/6.
 */
@Controller
@SessionAttributes(value = {"allStaff","UserList"})
@RequestMapping("staff")
public class StaffListController {
    @Resource
    private StaffListService staffListService;

    @Resource
    private UserListService userListService;

    private static Logger logger=Logger.getLogger(StaffListController.class);

    @RequestMapping("findalll")
    public String findAll(@ModelAttribute("UserList")UserList userList, HttpServletRequest request, Model model)throws Exception{
        model.addAttribute("UserList",userList);
        List<StaffList> all = staffListService.findAll();
        model.addAttribute("allStaff",all);
        return "teammember";
    }

}
