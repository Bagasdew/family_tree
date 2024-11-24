# README

This App is an API to create and get simple Family Tree

## Prerequisite
- Rails 7
- Postgresql 16 (lower version works too)

## How to Setup
1. pull this repo
2. run `bundle install` to install the gems
3. copy the `env.example` file, rename it into `.env` and setup your database connection accordingly (no need to create the database for now)
4. run `rake db:setup`, this will create your database, run the migrations, and seed the data
5. in terminal, run `rails s` and you can access the API via `localhost:3000`

## How to Use and Test
To test and access the API, you need to create txt file in the `/files` directory (DISCLAIMER: This api only works if you put the file inside the rails project folder. Other than that, no guarantee ;) )
I've included some files to test on the directory already
Now, how to use the api:
1. create a GET request (preferably using Postman), with route `{baseURL}/file_extractor/extract`
2. In the params section, specify the path and name of the file (e.g: `/files/make_childrens.txt`)
3. and send the request. result should looks like this
   ![image](https://github.com/user-attachments/assets/bc8777cf-3b35-4f15-89cb-4c99a871c4f0)

## Few Things to Note
1. This is a rails project, so there will be a lot of junk files that is included, I apologize for that
2. Should you have questions, feel free to reach out to me!
