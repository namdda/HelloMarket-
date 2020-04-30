package Board;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import Board.*;

public class FileService {
	private BoardDAO boarddao = null;
	public static String SAVE_PATH = "c:/upload"; // 저장할 장소

	
	public FileService() {
		boarddao = new BoardDAO();
	}
	
	
	 
	public void moveFile(BoardDTO boarddto, File file) {

		File dir = new File(SAVE_PATH + "/" + getToday());
		
		if(!dir.isDirectory()) {dir.mkdir();}
		
		
		if(file.isFile()) {
			File newFile1 = new File(SAVE_PATH + boarddto.getP_image1_path());
			file.renameTo(newFile1);
		}
	}
	
	public static String getToday() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(c.getTime());
	}
		
	public boolean fileUpload(String p_title, File file) {
		
		BoardDTO boarddto = new BoardDTO();
		boarddto.setP_title(p_title);
		boarddto.setP_image1_orig_name(file.getName());
		
		System.out.println("최종 파일 값" + boarddto);
		
		int isSuccess = boarddao.registBoard(boarddto);
		
		
		System.out.println("==============");
		System.out.println("=====성공여부 : " + isSuccess +  "=====");
		System.out.println("==============");
		
		System.out.println("최종 파일 값 : " + boarddao); // 아 이건 찍힘.  
		
		if(boarddto != null) {			
			moveFile(boarddto, file);
		}
		
		return true;
	}
}




















