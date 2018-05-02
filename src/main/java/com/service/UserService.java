package com.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.User;

@Service(value="userService")
public class UserService {

		@Resource(name="userDao")
		private UserDao userDao;
		
		
		public UserDao getUserDao() {
			return userDao;
		}
		public void setUserDao(UserDao userDao) {
			this.userDao = userDao;
		}
		
		
		public boolean addUser(User user) {
			return userDao.add(user);
		}
		
		public boolean deleteUser(Integer id) {
			return userDao.delete(id);
		}
		
		
		public boolean updateUser(User user){
			return userDao.update(user);
		}
		
		public User findUserByNameAndPassword (User user) {
			List<User> listUsers = userDao.findByNameAndPassword(user);
			
			if(listUsers.size() > 0) {
				return listUsers.get(0);
			}
			return null;
		}
		
		public List<User> findAllUsers(){
			List<User> listusers = userDao.findAll();
			if(listusers.size() > 0) {
				return listusers;
			}
			return null;
		}
		
		public long findTotalByUser() {
			long total = 0;
			total = userDao.findTotal();
			return total;
		}
		
		public User findUserByName (String name) {
	        List<User> listUsers = userDao.findByName(name);
			if(listUsers.size() > 0) {
				return listUsers.get(0);
			}
			return null;
		}
		
		
	
		
}
