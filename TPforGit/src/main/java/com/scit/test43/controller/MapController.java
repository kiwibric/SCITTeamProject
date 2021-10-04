package com.scit.test43.controller;

import java.util.ArrayList; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.dao.ReviewDAO;
import com.scit.test43.dao.TeacherDAO;
import com.scit.test43.vo.ReviewVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class MapController {

	@Autowired
	TeacherDAO dao;
	
	//ReviewDAO
	@Autowired
	ReviewDAO rdao;
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		return "map";
	
	}
	
	
	
	@ResponseBody
	@RequestMapping (value="list", method=RequestMethod.GET)
	public ArrayList<TeacherVO> list() {
		ArrayList<TeacherVO> list = dao.list();	
		return list;
	}
	@RequestMapping(value = "/infoWindow", method = RequestMethod.GET)
	public String infoWindow(String teacherId, Model model) {
		TeacherVO tc = dao.infoWindow(teacherId);
		model.addAttribute("tc", tc);
		
		//선생님 후기
		ArrayList<ReviewVO> selectTcReview = rdao.selectTcReview(teacherId);
		model.addAttribute("selectTcReview", selectTcReview);
		
		return "infoWindow";
	}
	@ResponseBody
	@RequestMapping(value = "filter", method = RequestMethod.GET)
	public ArrayList<TeacherVO> filter(String tc_gender, String tc_teachLan, String tc_avg, String tc_gen) {
		ArrayList<TeacherVO> list = dao.list();
		ArrayList<TeacherVO> result = new ArrayList<TeacherVO>();
		ArrayList<TeacherVO> result2 = new ArrayList<TeacherVO>();
		ArrayList<TeacherVO> result3 = new ArrayList<TeacherVO>();
		if (tc_gender.equals("")) {
			result = list;
		} else {
			for (TeacherVO i : list) {
				if (i.getTc_gender().equals(tc_gender)) {
					result.add(i);
				}
			}
		}
		if (tc_teachLan.equals("")) {
			result2 = result;
		} else {
			for (TeacherVO i : result) {
				if (i.getTc_teachLan().equals(tc_teachLan)) {
					result2.add(i);
					System.out.println(i);
				}
			}
		}
		System.out.println(tc_gen);
		if(tc_gen.equals("")) {
			result3 = result2;
		} else {
			if (tc_gen.equals("gen1")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() < 20) {
						result3.add(i);
						System.out.println(i);
					}
				}
			} else if(tc_gen.equals("gen2")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() >= 20 && i.getTc_age() < 30) {
						result3.add(i);
						System.out.println(i);
					}
				}
			} else if(tc_gen.equals("gen3")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() >= 30 && i.getTc_age() < 40) {
						result3.add(i);
						System.out.println(i);
					}
				}
			} else if(tc_gen.equals("gen4")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() >= 40 && i.getTc_age() < 50) {
						result3.add(i);
						System.out.println(i);
					}
				}
			} else if(tc_gen.equals("gen5")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() >= 50 && i.getTc_age() < 60) {
						result3.add(i);
						System.out.println(i);
					}
				}
			} else if(tc_gen.equals("gen6")) {
				for (TeacherVO i : result2) {
					if (i.getTc_age() >= 60 ) {
						result3.add(i);
						System.out.println(i);
					}
				}
			}
			
		}
		System.out.println(result3);
		return result3;
	
	}	
}