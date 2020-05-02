package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import User.Dbconn;


public class BoardDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   DataSource ds;
   String[] generatedColumns = {"p_idx"};
   
   public BoardDAO() {
      try {
         conn = Dbconn.getConnection();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   
   
   
   
   

      
   public int registBoard(BoardDTO boarddto) {
	        
	      
	      
	      try {
	    	 conn = Dbconn.getConnection();
	    	 
	    	 String sql = "insert into sellboard_4(user_email, deal_m1, p_image1_path, p_image1_orig_name, p_title, p_m_catagory, p_s_catagory, p_description, p_trade_kind, p_price, p_delivery, p_status1, p_transac_loc) " + 
			            "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	    	 

	         pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	         
	         pstmt.setString(1, boarddto.getUser_email());
	         System.out.println(boarddto.getUser_email());
	         pstmt.setString(2, boarddto.dealstr); //성공
	         pstmt.setString(3, boarddto.getP_image1_path());
	         pstmt.setString(4, boarddto.getP_image1_orig_name());
	         System.out.println(boarddto.getP_image1_orig_name());
	         pstmt.setString(5, boarddto.getP_title());
	         pstmt.setString(6, boarddto.getP_m_category());
	         pstmt.setString(7, boarddto.getP_s_category());
	         pstmt.setString(8, boarddto.getP_description());
	         pstmt.setString(9, boarddto.getP_trade_kind());
	         pstmt.setString(10, boarddto.getP_price());
	         pstmt.setString(11, boarddto.deliverstr);
	         pstmt.setString(12, boarddto.getP_status1());
	         pstmt.setString(13, boarddto.getP_transac_loc());
	         
	         int rows = pstmt.executeUpdate();
	        
	         try (ResultSet geneResultKey = pstmt.getGeneratedKeys()){
	            if(geneResultKey.next()) {
	               boarddto.setP_idx(geneResultKey.getInt("p_idx"));
	            }
	            
	            //System.out.println("boarddto : " + boarddto);
	         }
	         
	         if(rows>=1) {
		        	boarddto = this.updateFilePath(boarddto);
		        	 System.out.println("db 성공"); 
		         }
	      
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("데이터 연결 실패...");
	      }
	return 0;
	     
	   }
	   
   	public BoardDTO updateFilePath(BoardDTO boarddto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = Dbconn.getConnection();
			String sql = "UPDATE sellboard_4 SET p_image1_path = ? WHERE p_idx = ? ";
			pstmt = conn.prepareStatement(sql);
			
			
			String tmp = "/"+FileService.getToday()+"/"+boarddto.getP_idx()+".png";
			boarddto.setP_image1_path(tmp);
			pstmt.setString(1, tmp);
			pstmt.setInt(2, boarddto.getP_idx());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			Dbconn.close(conn, pstmt);
		}
		
		return boarddto;
   	}
   
   
   
    public Integer updateBoard(BoardDTO boarddto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rows = 0;
     
           try {

              conn = Dbconn.getConnection();
              String sql = "update sellboard_4 set deal_m=? p_image1_orig_name=? p_title=? p_m_category=?, p_s_category=?,  p_description=?  p_trade_kind=?, p_price=?, p_delivery=?, p_exchage=?, p_status1=?, p_status2=?, p_transac_loc=? where p_idx=?";
              pstmt = conn.prepareStatement(sql);
              //pstmt.setString(1, boarddto.getDeal_m1()+ boarddto.getDeal_m2());
              pstmt.setString(2, boarddto.getP_image1_orig_name());
              pstmt.setString(3, boarddto.getP_title());
              pstmt.setString(4, boarddto.getP_m_category());
              pstmt.setString(5, boarddto.getP_s_category());
              pstmt.setString(6, boarddto.getP_description());
              pstmt.setString(7, boarddto.getP_trade_kind());
              pstmt.setString(8, boarddto.getP_price());
              //pstmt.setString(9, boarddto.getP_delivery());
              //pstmt.setString(10, boarddto.getP_exchange());
              pstmt.setString(11, boarddto.getP_status1());
             // pstmt.setString(12, boarddto.getP_status2());
              pstmt.setString(13, boarddto.getP_transac_loc());
              
              try (ResultSet geneResultKey = pstmt.getGeneratedKeys()){
                 if(geneResultKey.next()) {
                    boarddto.setP_idx(geneResultKey.getInt("id"));
                 }
              }
              rows=pstmt.executeUpdate();
              
        }catch(Exception e) {
           e.printStackTrace();

        }finally {
           Dbconn.close(conn, pstmt);
        }
        return rows;
     }
   

   public List<BoardDTO> mainShowList(int page, int limit){//보이는거
      List<BoardDTO> boardList = new ArrayList<BoardDTO>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      int startrow = (page-1)*12+1;
      int endrow = startrow + limit -1;
      
      try {
         conn = Dbconn.getConnection();
         String sql = "select p_idx, p_image1_orig_name, p_title, p_price from sellboard_4 order by p_idx desc limit ?,?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, startrow);
         pstmt.setInt(2, endrow);  
         rs = pstmt.executeQuery();
         while(rs.next()) {
            BoardDTO boarddto = new BoardDTO();
            boarddto.setP_idx(rs.getInt("p_idx"));
            boarddto.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
            boarddto.setP_title(rs.getString("p_title"));
            boarddto.setP_price(rs.getString("p_price"));
            boardList.add(boarddto);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         Dbconn.close(conn, pstmt, rs);
      }
      return boardList;
   }
   
      public List<BoardDTO> clickCategory(String m_category, int page, int limit) {//클릭시 리스트형식
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int startrow = (page-1)*12+1;
            int endrow = startrow + limit -1;
            
            List<BoardDTO> boardList = new ArrayList<BoardDTO>();
            try {
               conn = Dbconn.getConnection();
               String sql = "select p_idx, p_image1_orig_name, p_title, p_price from sellboard_4 order by p_idx desc where p_m_catagory=? limit ?,?";
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, m_category);
              pstmt.setInt(2, startrow);
            pstmt.setInt(3, endrow);  
               rs = pstmt.executeQuery();
               while(rs.next()) {
                  BoardDTO boarddto = new BoardDTO();
                  boarddto.setP_idx(rs.getInt("p_idx"));
               boarddto.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
               boarddto.setP_title(rs.getString("p_title"));
               boarddto.setP_price(rs.getString("p_price"));
                  boardList.add(boarddto);
               }
            }catch(Exception e) {
               e.printStackTrace();
            }finally {
               Dbconn.close(conn, pstmt, rs);
            }
            return boardList;
         }
         
   
   
    public int getListCount(){
        int x =0;

        try {
            conn = ds.getConnection();
            pstmt= conn.prepareStatement("select count(*) from BOARDTABLE");
            rs = pstmt.executeQuery();

            if(rs.next()){
                x=rs.getInt(1);
            }
        } catch (Exception ex){
            System.out.println("getListCount 실패 : "+ex);
        } finally {
            Dbconn.close(conn, pstmt, rs);
        }
        return x;
    }
      
      
}