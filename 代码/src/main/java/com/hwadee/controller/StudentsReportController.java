package com.hwadee.controller;

import com.hwadee.model.MissionList;
import com.hwadee.model.UserList;
import com.hwadee.service.MissionListService;
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
@RequestMapping("/fix")
public class StudentsReportController {

    private final static Logger logger = LoggerFactory.getLogger(StudentsReportController.class);

    @Resource
    private MissionListService missionListService;

    @Resource
    private UserListService userListService;

    @RequestMapping("/studentPage")
    public String StudentPage(@ModelAttribute("UserList") UserList userList, HttpServletRequest request, Model model)throws Exception {
        model.addAttribute("UserList", userList);
        return "student baoxiu";
    }

    @RequestMapping("/baoxiu")  /*提交保修单的页面名，以/fix/? 格式*/
    public String Submit(@ModelAttribute("UserList") UserList userList,HttpServletRequest request, Model model) throws Exception{
        model.addAttribute("UserList", userList);
        return "network-baoxiu";
    }

    @RequestMapping("/network-baoxiu")
    public String NewReport(@ModelAttribute("UserList") UserList userList,HttpServletRequest req, Model model) throws Exception{
        model.addAttribute("UserList", userList);

        req.setCharacterEncoding("UTF-8");
        SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String missionTime = nowtime.format(new Date());
        String missionType = req.getParameter("reportType");
        String description = req.getParameter("description");
        String address = req.getParameter("address");
        MissionList newList = new MissionList();
        newList.setMissionType(missionType);
        newList.setMissionTime(missionTime);
        newList.setDescription(description);
        newList.setAddress(address);
        MissionList delivery = missionListService.MissionDelivery();
        newList.setUserId(userList.getUserId());
        newList.setMissionStatus(delivery.getMissionStatus());
        newList.setStaffId(delivery.getStaffId());
        newList.setStaffCost("0");
        newList.setFinishTime("unfinish");
        logger.debug("1111111111111111111111111111111");
        logger.debug(missionType);
        try {
            missionListService.insert(newList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        /*提交报告后自动生成任务单*/

        return "redirect:/fix/status";
    }

    @RequestMapping("status")
    public String lookUp(@ModelAttribute("UserList") UserList userList,HttpServletRequest request, Model model)throws Exception {
        model.addAttribute("UserList", userList);
        List<MissionList> missionLists = missionListService.findAll();
        model.addAttribute("allMission", missionLists);
        return "baoxiu-condition";
    }

}
