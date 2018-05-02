package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.model.Film;



@Repository(value="filmDao")
public class FilmDao {

		@Resource(name="hibernateTemplate")
		private HibernateTemplate hibernateTemplate;
		
		public HibernateTemplate getHibernateTemplate() {
			return hibernateTemplate;
		}
		public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
			this.hibernateTemplate = hibernateTemplate;
		}
	
	
		//findAll
		public  List<Film> findAll() {
			List<Film> movieList = new ArrayList<Film>();
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Film.class);
			movieList = (List<Film>) hibernateTemplate.findByCriteria(detachedCriteria);
	        return movieList;
		}
	
		//find by name
		public  List<Film> findByName(String title) {
			List<Film> movieList = new ArrayList<Film>();
			String queryString = "from Film where title like:title";
			movieList = (List<Film>) hibernateTemplate.findByNamedParam(queryString,"title",title);
	        return movieList;
		}
		
		//find by city
		public  List<Film> findByCity(String city) {
			List<Film> movieList = new ArrayList<Film>();
			String queryString = "from Film where city like:city";
			movieList = (List<Film>) hibernateTemplate.findByNamedParam(queryString,"city",city);
	        return movieList;
		}
		
		//find total
		public  long findTotal() {
			DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Film.class);
			detachedCriteria.setProjection(Projections.rowCount());
			List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria, 0, 1);
			return list.get(0);
		}
	
		//add
		public boolean add(Film movie) {
		    try {
		    	hibernateTemplate.save(movie);   
			} catch (Exception e) {
	           return false;			
			}
		    return true;
		}
	
		//delete
		public boolean delete(Integer id) {
			try {
				Film movie = hibernateTemplate.get(Film.class, id);
				hibernateTemplate.delete(movie);
			} catch (Exception e) {
				return false;
			}
			return true;
		}
	
		//update
		public boolean update(Film movie){
			try {
				hibernateTemplate.update(movie);
			} catch (Exception e) {
				return false;
			}
			return true;
		}

}
