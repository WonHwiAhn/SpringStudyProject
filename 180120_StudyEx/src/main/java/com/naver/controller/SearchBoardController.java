package com.naver.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.dao.PageMaker;
import com.naver.dao.SearchCriteria;
import com.naver.service.BoardService;
import com.naver.vo.BoardVO;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		System.out.println("cri ==> " + cri);
		//18.02.04 p.332에 의한 주석 
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		System.out.println("searchType ==> " + cri.getSearchType());
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//18.02.04 p.332에 의한 주석 
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		logger.info(cri.toString());
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		logger.info(rttr.toString());
		
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception{
		logger.info("regist get.........");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		logger.info("regist post .....");
		logger.info(board.toString());
		
		service.regist(board);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/sboard/list";
	}
}
