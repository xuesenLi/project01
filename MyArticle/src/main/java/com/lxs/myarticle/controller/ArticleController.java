package com.lxs.myarticle.controller;

import com.lxs.myarticle.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Mr.Li
 * @date 2019/7/24 - 18:52
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    //跳转到文章编辑
    @ResponseBody
    @RequestMapping("/toArticleWrite")
    public String toArticleWrite(){
        return "更新中...";
    }

    //toArticleTrash
    @ResponseBody
    @RequestMapping("/toArticleTrash")
    public String toArticleTrash(){
        return "更新中...";
    }

    //跳转到文章管理页面
    @RequestMapping("/toArticleManage")
    public String toArticleManage(){
        //跳转到分页查询。
        return "redirect:findByPage";
    }

    //分页查询
    @RequestMapping("/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "4", required = false) int pageSize,
                             HttpServletRequest request, Model model){
        //封装分页数据
        String verify = request.getParameter("r_verify");
        String publish = request.getParameter("r_publish");
        String status = request.getParameter("r_status");
        int r_verify=0, r_publish=0, r_status=0;
        if(verify != null){
            if(verify.equals("已审核")){
                r_verify = 1;
            }else{
                r_verify = 0;
            }
        }
        if(publish != null){
            if(publish.equals("已发布")){
                r_publish = 1;
            }else{
                r_publish = 0;
            }
        }
        if(status != null){
            if(status.equals("存在")){
                r_status = 1;
            }else{
                r_status = 0;
            }
        }
        Map<String, Object> comMap = new HashMap<>();
        comMap.put("verify", r_publish);
        comMap.put("publish", r_publish);
        comMap.put("status", r_status);

        //回显数据
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize, comMap));

        return "articleManage";
    }
}
