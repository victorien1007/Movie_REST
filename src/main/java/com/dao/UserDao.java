package com.dao;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.model.User;

@Repository(value="userDao")
public class UserDao {

		@Resource(name="hibernateTemplate")
		private HibernateTemplate hibernateTemplate;
		
		public HibernateTemplate getHibernateTemplate() {
			return hibernateTemplate;
		}
		public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
			this.hibernateTemplate = hibernateTemplate;
		}
	
		//add
		public boolean  add(User user) {
		    try {
		    	hibernateTemplate.save(user);   
			} catch (Exception e) {
	           return false;			
			}
		    return true;
		}
		
		//delete
		public boolean delete(Integer id) {
			try {
				User user = hibernateTemplate.get(User.class, id);
				hibernateTemplate.delete(user);
			} catch (Exception e) {
				return false;
			}
			return true;
		}
		
		//update
		public boolean update(User user){
			try {
				hibernateTemplate.update(user);
			} catch (Exception e) {
				return false;
			}
			return true;
		}
		
		//find by name and password
		public List<User>  findByNameAndPassword (User user) {
		   String queryString = "from User where username = :username and password = :password";
		   String paramNames[] = {"username" , "password"};
		   String paramValues[] = {user.getUsername(),user.getPassword()};
		   
		   List<User> lists = (List<User>) hibernateTemplate.findByNamedParam(queryString, paramNames, paramValues);
	       return lists;		
		}
	
		//find by name
		public  List<User> findByName(String name) {
			List<User> userList = new ArrayList<User>();
			String queryString = "from User where username like:name";
			userList = (List<User>) hibernateTemplate.findByNamedParam(queryString,"name",name);
	        return userList;
		}
	
		//find all
		public  List<User> findAll() {
			List<User> userList = new ArrayList<User>();
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
			userList = (List<User>) hibernateTemplate.findByCriteria(detachedCriteria);
	        return userList;
		}
	
		//find total
		public  long findTotal() {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(User.class);
			detachedCriteria.setProjection(Projections.rowCount());
			List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria, 0, 1);
			return list.get(0);
		}
	
	
}
