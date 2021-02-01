package com.reborn.web.controller.api.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reborn.web.entity.community.BoardView;
import com.reborn.web.entity.community.Comment;
import com.reborn.web.entity.community.CommentView;
import com.reborn.web.service.community.BoardService;

@RestController("apiBoardController")
@RequestMapping("/api/community/")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping("list")
	public List<BoardView> list(
			@RequestParam(name="p", defaultValue ="1") int page,
			@RequestParam(name="v", defaultValue = "10") int view,		
			@RequestParam(name="f", defaultValue ="title") String field,
			@RequestParam(name="q", defaultValue = "") String query, 
			@RequestParam(name="c", defaultValue = "", required = false) String option
			) {
		
		List<BoardView> list = service.getViewList(page, view, field, query, option);
	
		return list;				
	}
	
	@RequestMapping("{id}")	
	public Map<String, Object> detail(@PathVariable("id") int id){
		
		/* BoardView board = service.get(id); */
		/* dto.put("b", board); */
		List<CommentView> comment = service.getCommentViewList(id);
		int commentCount = service.getCommentCount(id);
		
		
		
		Map<String, Object> dto = new HashMap<>();
		dto.put("comment", comment);
		dto.put("commentCount", commentCount);
		
		return dto;
		
	}	
	
	
//	//댓글 수정 Get
//	@GetMapping("/commentEdit")
//	public String commentEdit(@PathVariable("id")  int id,
//			@PathVariable("commentId") int commentId, 
//			Model model) {
//			
//		
//		return "home.community.commentEdit";
//	}
//	
	//댓글 수정	
	@RequestMapping("{id}/commentEdit")							//boardId
	public  List<CommentView> comment(Model model, @PathVariable("id") int id,
			@RequestParam(name="commentId") int commentId, @RequestParam(name="content") String content) {
		System.out.println(id);
		System.out.println(commentId);
		System.out.println(content);
		
		Comment origin = service.commentGet(commentId);
		origin.setContent(content);
		service.update(origin);
		
//		Map<String, Object> dto = new HashMap<>();
//		dto.put("comment", comment);
		
		List<CommentView> commentView = service.getCommentViewList(id);
		System.out.println(commentView);
		
		
		return  commentView;
	}
	
	
}
