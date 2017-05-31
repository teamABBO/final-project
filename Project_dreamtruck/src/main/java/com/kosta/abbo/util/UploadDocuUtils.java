package com.kosta.abbo.util;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.util.FileCopyUtils;

public class UploadDocuUtils {
	private static Logger logger = Logger.getLogger(UploadDocuUtils.class);
	
	/**
	 * 경로 생성 메소드
	 * @param uploadPath
	 * @param paths
	 */
	private static void makeDir(String uploadPath, String... paths) {
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if (! dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
	
	/**
	 * 회원별 파일 경로 반환 메소드
	 * @param uploadPath
	 * @return
	 */
	private static String calcPath(int userId, String uploadPath) {
		String userPath = File.separator + userId;
		
		makeDir(uploadPath, userPath);
		
		logger.info(uploadPath + userPath);
		
		return userPath;
	}

	/**
	 * 파일 업로드 메소드
	 * @param uploadPath
	 * @param originalName
	 * @param fileData
	 * @return
	 * @throws IOException
	 */
	public static String uploadFile(int userId, String uploadPath, String originalName, byte[] fileData) throws IOException {
		String savedName = originalName;
		
		String savedPath = calcPath(userId, uploadPath);

		File target = new File(uploadPath + savedPath, savedName);

		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	
}
