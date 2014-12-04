package mypackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author MPK05
 */
public class User {

    String username;
    String password;
    String fullName;
    int userLevel;
    
    public User() {
    }

    public User(String staffID, String password, String name,int level) {
        this.username = staffID;
        this.password = password;
        fullName = name;
        userLevel = level;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return fullName;
    }

    public void setName(String name) {
        fullName = name;
    }
    
    public int getLevel(){
        return userLevel;
    }
    
    public void setUserLevel(int level){
        userLevel = level;
    }
}
