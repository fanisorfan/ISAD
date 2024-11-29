package agrowise;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    /**
     * Returns a list of all users
     * 
     * @return List<User>
     * @throws Exception
     */
    public List<User> getUsers() throws Exception {
        List<User> users = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        String sql = "SELECT firstname, lastname, username, email, password FROM registration;";
        try{
         con = db.getConnection(); 
         PreparedStatement stmt = con.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery();
         while (rs.next()) {
           String fn = rs.getString("firstname");
           String ln = rs.getString("lastname");
           String username = rs.getString("username");
           String email = rs.getString("email");
           String password = rs.getString("password");
           User user = new User(fn, ln, email, username, password);
           users.add(user);
         }
        
         rs.close();
         stmt.close();
         db.close();
        
        }catch (SQLException e){
           throw new SQLException("Error accessing the database: " 
               + e.getMessage());

        }
        finally {
           try {
               db.close();
          } catch (Exception e) {

          }

        }
       
       return users;
       
   }

    public User findUser(String username) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            conn = db.getConnection();
            String query = "SELECT * FROM registration WHERE username = ? LIMIT 1";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
    
            if (rs.next()) {
                    String firstname = rs.getString("firstname");
                    String lastname =rs.getString("lastname");
                    String email =rs.getString("email");
                    String password =rs.getString("password");
                    user = new User(firstname, lastname, email, username, password);
                    return user;
            } else {
                return null;
            }
        } catch (SQLException e) {
            throw new Exception("Error retrieving user: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }

    
    public User authenticate(String username, String password) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    
        try {
            conn = db.getConnection();
            String query = "SELECT * FROM registration WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
    
            if (rs.next()) {
                return new User(
                    rs.getString("username"),
                    rs.getString("firstname"),
                    rs.getString("lastname"),
                    rs.getString("email"),
                    rs.getString("password")
                );
            } else {
                throw new Exception("Wrong username or password");
            }
        } catch (SQLException e) {
            throw new Exception("Error during authentication: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
    
    /**
     * Registers a new user
     * 
     * @param user
     * @throws Exception
     */
    public void register(User user) throws Exception {
        DB db = new DB();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();

            String checkQuery = "SELECT * FROM registration WHERE username = ? OR email = ?";
            ps = conn.prepareStatement(checkQuery);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            rs = ps.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username or email already registered");
            }

            String insertQuery = "INSERT INTO registration (firstname, lastname, email, username, password) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(insertQuery);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getFirstname());
            ps.setString(3, user.getLastname());
			ps.setString(4, user.getUsername());
            ps.setString(5, user.getPassword());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Error during registration: " + e.getMessage(), e);
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
}
