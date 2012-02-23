Psychology Test
==============
This is a system that has been built to be used by scientists to organize psychology experiments. It allows easily managing and creating slides, stories and questions and organizing experiments and keeping track of data easily. 

Installation Instructions:
==========================
The application can be deployed in Tomcat, VMWare or any of your other preferred web server. Application needs to connect to MySQL database for storage. The connection parameters can be specified in "WEB-INF/classes/META-INF/spring/database.properties" file. 
To deploy the application in tomcat or VMWare, copy the packaged war file to "TOMCAT_HOME/webapps/" and then start your server.
Please report any bugs you see at pulkit.goyal@epfl.ch or sapan.diwakar@epfl.ch.

How to use it:
==============
Once the application is deployed successfuly, you can browse the admin panel by visiting localhost:<port>/PsyTest.