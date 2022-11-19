/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.auth;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author NamND
 */
public class AccountDAO extends DBContext {

    public List<Account> getAllAccounts() {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[amount]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[account]";
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10));
                list.add(account);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Account checkAccount(String username, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[amount]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE username = ?\n"
                + "  AND password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[amount]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByEmail(String email) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[amount]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addAccount(String username, String password, String email, String fullname, String dob, String phone) {
        String sql = "INSERT INTO dbo.account (username,\n"
                + "                         password,\n"
                + "                         email,\n"
                + "                         fullname,\n"
                + "                         dob,\n"
                + "                         phone)\n"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, fullname);
            st.setString(5, dob);
            st.setString(6, phone);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account getAccountById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[amount]\n"
                + "      ,[role]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getDouble(9), rs.getInt(10));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Account account) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[fullname]\n"
                + "           ,[dob]\n"
                + "           ,[phone]\n"
                + "           ,[avatar]\n"
                + "           ,[amount]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getFullname());
            st.setDate(5, account.getDob());
            st.setString(6, account.getPhone());
            st.setString(7, account.getAvatar());
            st.setDouble(8, account.getAmount());
            st.setInt(9, account.getRole());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Account account) {
        String sql = "UPDATE [dbo].[account]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[amount] = ?\n"
                + "      ,[role] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getFullname());
            st.setDate(5, account.getDob());
            st.setString(6, account.getPhone());
            st.setString(7, account.getAvatar());
            st.setDouble(8, account.getAmount());
            st.setInt(9, account.getRole());
            st.setInt(10, account.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[account]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
