package com.kosta.abbo.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static Logger logger = Logger.getLogger(UploadFileUtils.class);
	
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
	 * 날짜별 경로 반환 메소드
	 * @param uploadPath
	 * @return
	 */
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}
	
	/**
	 * 썸네일 생성 메소드
	 * @param uploadPath
	 * @param path
	 * @param fileName
	 * @return
	 * @throws IOException
	 */
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	/**
	 * 이미지 파일이 아닐 때 아이콘 생성 메소드
	 * @param uploadPath
	 * @param path
	 * @param fileName
	 * @return
	 */
	private static String makeIcon(String uploadPath, String path, String fileName) {
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	/**
	 * 파일 업로드 메소드
	 * @param uploadPath
	 * @param originalName
	 * @param fileData
	 * @return
	 * @throws IOException
	 */
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();

		String savedName = uid.toString() + "_" + originalName;
		
		String savedPath = calcPath(uploadPath);

		File target = new File(uploadPath + savedPath, savedName);

		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		
		String uploadedFileName = null;
		
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
}
