
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BookDB implements DatabaseInfo{
 //--------------------------------------------------------------------
    public static Book getBook(String bid){
        return null;
    }
 //--------------------------------------------------------------------   
    public static Connection getConnect(){
        try {
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/mydb");
            return ds.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

 //--------------------------------------------------------------------   
    public static Vector<Vector> searchByCategory(String cat){
        Vector<Vector> books= new Vector<>();
        try (Connection con=getConnect()){
            con.setAutoCommit(false);
            PreparedStatement stmt= con.prepareStatement("Select BookID, Title, Author, Keyword from Books where category=?");
            stmt.setString(1,cat); 
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                Vector b= new Vector();
                b.add(rs.getString(1));
                b.add(rs.getString(2));
                b.add(rs.getString(3));
                b.add(rs.getString(4));
                b.add(Boolean.FALSE);
                books.add(b);
            }
            con.commit();
            con.close();
            } catch (Exception ex) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }
 //-------------------------------------------------------------------- 
    public static Vector<String> getBookHeader(){
        Vector<String> hd= new Vector<>();
        hd.add("Book ID");
        hd.add("Book Title");
        hd.add("Author");
        hd.add("Keyword");
        hd.add("Selected");
        return hd;
    }
 //-------------------------------------------------------------------- 
    public static ArrayList<Book> searchByCat(String cID){
         ArrayList<Book> books= new ArrayList<Book>();
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            PreparedStatement stmt= con.prepareStatement("Select BookID, Title, Author, Keyword from Books where category=?");
            stmt.setString(1,cID);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                books.add(new Book(rs.getString(1),rs.getString(2),rs.getString(3),cID,rs.getString(4)));
            }
            con.close();
            } catch (Exception ex) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }
 //--------------------------------------------------------------------   
    public static void addNewBook(Book b){
        
    }
 //--------------------------------------------------------------------   
    public static Vector<Vector> searchByTitle(String title){
        return null;
    }
 //--------------------------------------------------------------------   
    public static Vector<Category> getCats(){
        Vector<Category> v= new Vector<>();
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL,userDB,passDB);
            PreparedStatement stmt= con.prepareStatement("Select catID, catName from Category");
            ResultSet rs=stmt.executeQuery();
            while(rs.next()){
                String cid= rs.getString(1);
                String cName= rs.getString(2);
                v.add(new Category(cid,cName));
            }
            con.close();
          } catch (Exception ex) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
    } 
    
 //--------------------------------------------------------------------   
}
