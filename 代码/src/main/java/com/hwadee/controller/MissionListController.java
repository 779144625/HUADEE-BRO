package com.hwadee.controller;

import com.hwadee.dao.StaffListDao;
import com.hwadee.model.MissionList;
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

@Controller
@SessionAttributes("UserList")
@RequestMapping("/admin")
public class MissionListController {

    @Resource
    private com.hwadee.service.MissionListService missionListService;

    @Resource
    private StaffListService staffListService;

    @Resource
    private UserListService userListService;

    @RequestMapping("/missionList")
    public String ShowMissionLists(@ModelAttribute("UserList")UserList userList, Model model, HttpServletRequest request) throws Exception{
        model.addAttribute("UserList",userList);

        List<MissionList> missionList = missionListService.findMission();
        model.addAttribute("allMission", missionList);
        return "missionList";
    }

    @RequestMapping("/delete")
    public String updateMissionList(@ModelAttribute("UserList")UserList userList,HttpServletRequest request,Model model)throws Exception{
        model.addAttribute("UserList",userList);

        int missionID = Integer.parseInt(request.getParameter("id"));


        missionListService.delete(missionID);
        return "redirect:/admin/missionList";
    }

}




