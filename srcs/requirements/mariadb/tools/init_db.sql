CREATE DATABASE IF NOT EXISTS dbwpname;
CREATE USER IF NOT EXISTS 'dbwpuser'@'%' IDENTIFIED BY 'dbwppwd'; 
GRANT ALL PRIVILEGES ON dbwpname.* to 'dbwpuser'@'%'; 
FLUSH PRIVILEGES; 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'dbwprootpwd';