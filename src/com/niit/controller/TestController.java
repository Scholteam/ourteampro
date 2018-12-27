package com.niit.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    @RequestMapping(value = "/PIN.mvc")
    @ResponseBody
    public void pin(HttpServletResponse response, HttpSession session) throws IOException {
        response.setHeader("Pragma","No-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");//说明请求生成的响应是图片
        int width=100, height=22;//定义图片宽高
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
 
        Graphics g = image.getGraphics();//获取画笔
        Random random = new Random();
        Color[] colors = new Color[]{Color.BLUE,Color.BLACK,Color.GREEN,Color.RED};//设置了四种字体的颜色
        //背景色填充
        g.setColor(new Color(240,240,240));
        g.fillRect(1, 1, width-1, height-1);
        //边缘颜色设置
        g.setColor(new Color(102,102,102));
        g.drawRect(0, 0, width-1, height-1);
 
        g.setFont(new Font("Times New Roman", Font.PLAIN, 17));//设置字体
 
        //画干扰线
        g.setColor(new Color(220,220,220));
        for (int i=0;i<155;i++)
        {
            int x = random.nextInt(width - 1);
            int y = random.nextInt(height - 1);
            int xl = random.nextInt(6) + 1;
            int yl = random.nextInt(12) + 1;
            g.drawLine(x,y,x + xl,y + yl);
        }
 
 
        //验证码的字符来源，也可以用汉字，这里就只用数字加字母了
        char[] source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        //生成随机字符串
        String pinNum = "";
        for (int i=0;i<6;i++)
        {
            int itmp = random.nextInt(source.length);
            pinNum += source[itmp];
            g.setColor(colors[random.nextInt(colors.length)]);
            g.drawString(String.valueOf(source[itmp]),15*i+10,16);
        }
        //将字符串存入session中，以便后面做验证
        session.setAttribute("equals_pin",pinNum);
        g.dispose();//销毁图形界面资源
        ImageIO.write(image, "JPEG", response.getOutputStream());//将图片写入response的输出流
    }
}
