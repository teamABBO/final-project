package com.kosta.abbo.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadEventUtils {
   private static Logger logger = Logger.getLogger(UploadUserUtils.class);
   
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
            logger.info("폴더 생성 경로 : " + uploadPath + path);
            dirPath.mkdirs();
         }
      }
   }
   
   /**
    * 회원별 파일 경로 반환 메소드
    * @param uploadPath
    * @return
    */
   private static String calcPath(String uploadPath, int eventId) {
      String userPath = File.separator + eventId ;
      
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
   public static String uploadFile(String uploadPath, int eventId, String originalName, byte[] fileData) throws Exception {
      
      String savedName = originalName;
      
      String savedPath = calcPath(uploadPath, eventId);

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
}