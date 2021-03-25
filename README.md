# bookmark_manager

As a user
So that I can choose a website
I would like to see a list of bookmarks

| class     | instances | methods  |
|-----------|-----------|----------|
| user      | @username |          |
| bookmarks | @website  | list     |
|           |           |          |

As a user
So that I can add a new website
I would like to add a bookmark

| class     | responsibilities | colabs   |
|-----------|------------------|----------|
|           |                  |          |
| bookmarks | add-bookmark     |          |
|           |                  |          |
- post request to app
- app adds new bookmark to database
- database return updated table
- app reuqests feedback from views
- views send updated list/message

As a user
So that i can remove bookmarks from my bookmarks manager
I would like to delete a bookmark

| class     | responsibilities | colabs   |
|-----------|------------------|----------|
|           |                  |          |
| bookmarks | delete-bookmark  |          |
|           |                  |          |

- post request to app
- app deletes bookmark from database
- database return updated table
- app requests feedback from views
- views send updated list/message



### To set up the database
Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql

# Setting up test database

Connect to psql
Create the database using the psql command
CREATE DATABASE bookmark_manager_test;
Connect to the database using the pqsl command
\c bookmark_manager_test;
Run the query we have saved in the file 01_create_bookmarks_table.sql

**Using TablePlus as GUI to manage databases**

## Current project status

- 2 RSPEC tests failing due to the bookmarks only diplaying the url
- could change the result.map in bookmarks.all to display the title but would need to change tests
- Also need to look at initializing :id and :url
- Also need to href the url to make it a clickable link
- Go back overstep 10 walkthrouh and implement missing features
- Go through step 11 walkthrough and implement missing features
