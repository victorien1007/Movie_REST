package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.FilmDao;
import com.model.Film;

@Service(value="filmService")
public class FilmService {

		@Resource(name="filmDao")
		private FilmDao filmDao;
	
		
		public FilmDao getFilmDao() {
			return filmDao;
		}

		public void setFilmDao(FilmDao filmDao) {
			this.filmDao = filmDao;
		}

		public boolean addFilm(Film film) {
			return filmDao.add(film);
		}
		
		public boolean deleteFilm(Integer id) {
			return filmDao.delete(id);
		}
		
		
		public boolean updateFilm(Film film){
			return filmDao.update(film);
		}
		
		public List<Film> findAllFilms(){
			List<Film> listfilms = filmDao.findAll();
			if(listfilms.size() > 0) {
				return listfilms;
			}
			return null;
		}
		
		public List<Film> findFilmsByCity(String city){
			List<Film> listfilms = filmDao.findByCity(city);
			if(listfilms.size() > 0) {
				return listfilms;
			}
			return null;
		}
		
		public long findTotalByFilms() {
			long total = 0;
			total = filmDao.findTotal();
			return total;
		}
		
		public Film findFilmByName (String name) {
	        List<Film> listFilms = filmDao.findByName(name);
			if(listFilms.size() > 0) {
				return listFilms.get(0);
			}
			return null;
		}
	
}
