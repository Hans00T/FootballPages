## Football pages
### What is it?
This is a simple web application that allows you to view the results of football matches and the current standings of the teams in the championship.
The UI uses handlebars templates and the data is stored in a MySQL database. The site has three links on the left side of the page:
- League table: shows the current standings of the teams in the championship.
- Players and teams: shows the list of teams and players in the championship. All the players are listed on the left side and the teams on the right.
- Information about players: shows a table of teams. Each name of a team is a link that opens a table on the right side of the page with the players of that team.
### How to use it?
To use the application, you need to install the dependencies using the command:
```
npm install
```
Then you need to create a database and tables by logging into MySQL on the command line:
```
mysql -u your_user -p
```
Then create a database:
```
CREATE DATABASE your_db_database;
```
And create tables by copying the script from the jalkapallo.sql file. It also fills the tables with demo data.
Then you need to start the application using the command in the root directory of the project:
```
npm start
```
And open the browser at the address:
```
http://your_host:your_port
```
Alternatively, if you have nodemon installed globally, you can use the following command in the root directory of the project:
```
nodemon index.js
```

### Dotenv
The application uses the dotenv module to store environment variables. To use it, you need to create a file .env in the root directory of the project and add the following variables to it:
```
HOST=your_host
PORT=your_port
DB_HOST=your_db_host
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_DATABASE=your_db_database
```
Make sure your DB_DATABASE is the same as the name of the database you created earlier and that your DB_USER has access to it.