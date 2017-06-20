package com.kosta.abbo.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.abbo.HomeController;
import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.PageMaker;
import com.kosta.abbo.review.domain.Review;
import com.kosta.abbo.review.service.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewController {
	@Inject
	private ReviewService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * 댓글 등록
	 * 
	 * @param content
	 * @param star
	 * @param writerId
	 * @param targetId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestParam("content") String content, @RequestParam("star") int star,
			@RequestParam("writerId") int writerId, @RequestParam("targetId") int targetId) {
		logger.info("댓글 등록");
		ResponseEntity<String> entity = null;
		Review review = new Review();
		review.setContent(content);
		review.setStar(star);
		review.setWriterId(writerId);
		review.setTargetId(targetId);
		try {
			service.create(review);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**
	 * 댓글 목록
	 * 
	 * @param targetId
	 * @return
	 */
	@RequestMapping(value = "/all/{targetId}", method = RequestMethod.GET)
	public ResponseEntity<List<Review>> list(@PathVariable("targetId") int targetId) {
		logger.info("댓글 목록");
		ResponseEntity<List<Review>> entity = null;

		try {
			entity = new ResponseEntity<>(service.list(targetId), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/**
	 * 댓글 수정
	 * 
	 * @param reviewId
	 * @param content
	 * @param star
	 * @param regdate
	 * @return
	 */
	@RequestMapping(value = "/{reviewId}", method = { RequestMethod.POST })
	public ResponseEntity<String> update(@PathVariable("reviewId") int reviewId,
			@RequestParam("content") String content, @RequestParam("star") int star,
			@RequestParam("regdate") String regdate) {

		logger.info("댓글 수정");

		ResponseEntity<String> entity = null;
		Review review = new Review();
		review.setContent(content);
		review.setStar(star);
		review.setRegdate(regdate);
		review.setReviewId(reviewId);

		try {
			service.update(review);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/**
	 * 댓글 삭제
	 * 
	 * @param reviewId
	 * @return
	 */
	@RequestMapping(value = "/{reviewId}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reviewId") int reviewId) {
		logger.info("댓글 삭제");
		ResponseEntity<String> entity = null;

		try {
			service.delete(reviewId);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	/**
	 * 댓글 목록 - 페이징
	 * 
	 * @param targetId
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/{targetId}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("targetId") int targetId,
			@PathVariable("page") int page) {
		logger.info("댓글 목록 - 페이징");
		ResponseEntity<Map<String, Object>> entity = null;

		try {

			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			Map<String, Object> map = new HashMap<String, Object>();
			List<Review> list = service.listReviewPage(targetId, cri);

			map.put("list", list);

			int reviewCount = service.count(targetId);
			pageMaker.setTotalCount(reviewCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
}
