package com.lxs.myarticle.controller;

import com.lxs.myarticle.pojo.AJAXResult;
import com.lxs.myarticle.pojo.User;
import com.lxs.myarticle.service.UserService;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author Mr.Li
 * @date 2019/7/24 - 11:15
 */
@Controller
@RequestMapping("/users")
public class Usercontroller {


    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index(HttpSession session, Model model){
        //获取sesion 里面是否有一个用户
        User user = (User) session.getAttribute("user");
        if(user != null){

            //表示应该将session里面的过期时间进行刷新
            session.setMaxInactiveInterval(300);

            return "page";
        }else{
            return "index";
        }

    }


    //登录验证
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session, Model model){
        //userService.login(username, password);
        System.out.println(username + " =====" + password);
        User user1 = userService.login(username, password);
        if(user1 != null){
            session.setAttribute("user", user1);

            //设置过期时间， 单位 秒,
            session.setMaxInactiveInterval(300);
            return "page";
        }else{
            model.addAttribute("msg", "用户名或则密码错误");
            return "index";
        }


    }

    //注册表单
    @RequestMapping("/register")
    public String register(User user, HttpSession session){
        userService.insert(user);

        session.setAttribute("user", user);
        return "page";
    }

    @RequestMapping("/loginout")
    public String loginout(HttpSession session){
        session.setAttribute("user", null);

        return "index";
    }



    //findByName
    @ResponseBody
    @RequestMapping("/findByName")
    public Object findByName(String username){
        AJAXResult result = new AJAXResult();
        User user = userService.findByName(username);
        if(user != null){
            result.setSuccess(false);
        }else{
            result.setSuccess(true);
        }
        return result;
    }

}
