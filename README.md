# How to set up project on your PC


Before we start, open the repository in VS Code.

### XAMPP Server

1. Open XAMPP control panel and create a new database called `system_database`
2. At the top, go to Import, then choose the sql file named `system_database` in the ./backend folder of the project.
3. Refresh to make sure that the database was imported successfully.

### React + Vite

1. Go to the terminal tab at the top of VS Code, then choose New Terminal.
2. Type this command to install project dependencies:

	``` 
	npm install 
	```
 
4. Then type this command to run the react server:

	```
	npm run dev
	```

### Express Server

1. Go to the terminal tab at the top of VS Code, then choose New Terminal.
2. To run the Express server type this command:
	``` 
	node --watch backend/server.js
	```
3. The terminal should say: `Server is running on http://localhost:5000`
