package com.shop.web;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import com.shop.DAO.AccountDAO;
import com.shop.service.UserService;

@WebListener
public class ShopSCListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce)  { 
    	try {
            Context initContext = new InitialContext();
            Context envContext = (Context)initContext.lookup("java:/comp/env");
            DataSource dataSource = (DataSource) envContext.lookup("jdbc/shop");
            ServletContext context = sce.getServletContext();
            context.setAttribute("dataSource", dataSource);            
            context.setAttribute("userService", new UserService(new AccountDAO(dataSource)));
            System.out.println("testestestsetsetset");
//            context.setAttribute("message", new MessageDAO());            
        } catch (NamingException ex) {
            throw new RuntimeException(ex);
        }
    }
    
	public void contextDestroyed(ServletContextEvent sce)  { 
         
    }
}
