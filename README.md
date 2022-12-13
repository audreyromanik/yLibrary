# yLibrary? 

This repo contains the setup for spinning 2 docker containers:
  1. A MySQL 8 container, for creation and use of a database
  2. A Python Flask container to implement the rest API

This repo also has the setup of the yLibrary database, with its initial values, and all the GET and POST requests needed to run 
the app.

yLibrary? is a project created for CS3200-Database Design, that works to emulate and preserve the memory of Z-Library.

yLibrary? is an online database where books, articles and papers are collected for free online use. 
This product will increase accessibility to numerous scholarly articles, educational textbooks and other general text-based online works. 
By providing this content for free, students and those in low socioeconomic standpoints will have an easier and more affordable 
access to academic works, as well as other novels or articles to broaden ones world view.
  
## How to start the containers and set up in Appsmith
**Important** - you need Docker Desktop and ngrok installed on your device

  1. Clone this repository
  note: Once the repo has been cloned, you may need to mark the src directory as Source Root for everything to work.
  2. Open terminal or command prompt and navigate to the folder with the 'docker-compose.yml' file
  3. Build the image with by typing 'docker compose build' into terminal
  4. Start the containers by typing 'docker compose up'
  5. Open a new terminal or command prompt
  6. Type './ngrok http 8001' so that ngrock will create a safe link to connect the API
  7. Copy the '.io' link following the word 'Forwarding" from the terminal
  8. Go to Appsmith and open the yLibrary? project
  9. Scroll down the side to the Datasources section and select yLibrary API
  10. Select edit and paste the link that you copied from terminal into the URL box, then save
  11. You can then deploy the App through Appsmith

## Instuctions for demo use of yLibrary
**Note** - The containers should already be running and a new ngrok link should be implemented in Appsmith  
**Note2** - The video submitted for class also does this demo

**Note3** - The 'Search_result' and 'Edit_upload' page should only be navigated to as described, clicking on the tab without searching 
for a file will not lead to any results or functions  
**Note4** - if you click the 'logo' icon on the top left of any page it will navigate you to the 'Home_search' page

  1. Deply the app and start on the 'Home_search' page
  2. Click the search bar and type 'how' or 'to' -> must search a title or part of a title for results to show
  3. click the result 'How to database' -> this should direct you to the 'search_result' page in the app
  4. Once in the 'Seach_result' page choose a user from the select menu in the top right, you can then do 3 functions
  5. You can rate the book by selecting the number of stars, and this will update the ratings seen on the page
  6. You can click one of the download option(s), epub or pdf -> cannot download same file type multiple times with same user
  7. You can click the edit button under the user selection, this will navigate you too the 'Edit_upload' page
  8. Once in the 'Edit_upload' page, there is a form where you can input an image URL for the file and/or change its description
  9. When done click submit, to see results repeat steps 2 and 3 and make sure you are on the 'Search_result' page
  10.You can also click the tab at the top to move to the 'Operator_functions' page
  11. This page will show results of edits and downloads of files, stating the isbn when it was edited/downloaded and by which account number  
  *note the time in the download section will be listed as 00:00:00 because only the date is recorded*
  
  

