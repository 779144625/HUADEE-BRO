package com.hwadee.controller;

import com.hwadee.model.MissionList;
import com.hwadee.model.StaffList;
import com.hwadee.model.UserList;
import com.hwadee.service.MissionListService;
import com.hwadee.service.StaffListService;
import com.hwadee.service.UserListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes("UserList")
@RequestMapping("/admin")
public class ManagerController {

    @Resource
    private StaffListService staffListService;

    @Resource
    private MissionListService missionListService;

    @Resource
    private UserListService userListService;

    private final static Logger logger = LoggerFactory.getLogger(ManagerController.class);

    @GetMapping("/guzhang")
    public String guzhang(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model)throws Exception {
        String id = request.getParameter("id");
        model.addAttribute("UserList", userList);
        return "guzhang";
    }

    @GetMapping("/worker")
    public String Worker(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
        model.addAttribute("UserList", userList);
        if(userList.getUserType().equals("维修人员")||userList.getUserType().equals("管理人员")) {
            return "worker";
        }
        else {
            return "redirect:/admin/guzhang";
        }
    }

    @GetMapping("/admin")
    public String Manager(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model) throws Exception{
        model.addAttribute("UserList", userList);

        return "manager";
    }

    @GetMapping("/teammember")
    public String TeamMember(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model) throws Exception{
        model.addAttribute("UserList", userList);

        return "teammember";
    }

    @GetMapping("/findhistory")
    public String History(@ModelAttribute("UserList")UserList userList,Model model, HttpServletRequest request) throws Exception{

        model.addAttribute("UserList", userList);
        List<MissionList> missionLists = missionListService.findAll();
        model.addAttribute("allMission", missionLists);
        return "history";
    }

    @GetMapping("/result")
    public String Result(@ModelAttribute("UserList")UserList userList,HttpServletRequest request, Model model) throws Exception{

        model.addAttribute("UserList", userList);

        return "result";
    }

    @PostMapping("resultsave")
    public String resultsave(@ModelAttribute("UserList")UserList userList,String missionId,String staffId,String staffCost,String missionStatus,Model model) throws Exception{

        model.addAttribute("UserList",userList);

        MissionList result = new MissionList();
        int missionID = Integer.parseInt(missionId);
        int staffID = Integer.parseInt(staffId);
        MissionList missionList = missionListService.findByMissionId(missionID);
        SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String finishTime = nowtime.format(new Date());
        result.setMissionId(missionID);
        result.setStaffId(staffID);
        result.setStaffCost(staffCost);
        result.setMissionStatus(missionList.getMissionStatus());
        result.setFinishTime(finishTime);
        result.setMissionTime(missionList.getMissionTime());
        result.setMissionType(missionList.getMissionType());
        result.setDescription(missionList.getDescription());
        result.setAddress(missionList.getAddress());
        result.setUserId(missionList.getUserId());
        if(missionList.getMissionStatus().equals("Deliveried")){
            loop:if(missionStatus.equals("finish")||missionStatus.equals("deny")) {
                StaffList staffList = staffListService.findByID(staffID);
                String a = staffList.getWorkStatus();
                int a1 = Integer.parseInt(a) - 1;
                a = "" + a1 + "";
                staffList.setWorkStatus(a);
                result.setMissionStatus(missionStatus);
                staffListService.update(staffList);
            }
            else {
                break loop;
            }
        }
        else if (missionList.getMissionStatus().equals("unDelivery")){
            result.setMissionStatus(missionStatus);
        }
        missionListService.update(result);
        return "redirect:/admin/admin";
    }
}
