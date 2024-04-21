
package model;

public interface DBInfo {
    String dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=Schools;intergratedSecurity=false;encrypt=false;trustServerCertificate=true";
    String dbUser = "AnNguyen";
    String dbPass = "abcd";
    String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
}
