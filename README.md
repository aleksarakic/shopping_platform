## Shopping Platform 
- ruby-2.6.3

## Running the application:
1. Extract files to the location where you want the `shopping_platform` to be extracted
2. Open terminal
3. Change the current working directory to the extracted `shopping_platform` directory

#### Setting up the database
4. run `rake db:create` to build database
5. run `rake db:migrate` to run the migrations
6. run `rake db:seed` to populate db
7. run `RAILS_ENV=test rake db:seed` to populate test database
