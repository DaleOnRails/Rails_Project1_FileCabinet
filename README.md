# Site Img Overview:

![site-image1](Screenshot from 2019-10-04 11-24-15.png)


![site-image2](http://url/to/img.png)


![site-image3](http://url/to/img.png)


![site-image4](http://url/to/img.png)


![site-image5](http://url/to/img.png)


![site-image6](http://url/to/img.png)


![site-image7](http://url/to/img.png)







#=================================================================

# How to get this application running on your local machine:

# Tech Stack 
The following was used in the development process:

* Ruby version:
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

* System dependencies:
Since this application has been deployed to the Heroku Cloud Application Platform a local server is not required. Do you have internet connection? Then your good to go... simply follow the link listed at the top of this readme.md file.

* Database creation:
This applications database development process involved postgresql/pgadmin4. More information can be found in the schema.rb file in the code repository.

* Code:
Experimented with using HAML for the first time. Although i believe it comes with slower proccessing compared to the likes of ERB, it was fun and relativley easy as pie to learn.


#=================================================================


# Development instructions/Steps
For anyone who wishes to learn information on the deployment process using heroku, as well as how to create their own rails application. I have listed (**vaguely**) the steps i followed below:

IMPORTANT-NOTE: Please note the emphasis on vague. This documentation is rushed because i like to spend my time coding rather then documenting.

NOTE: The purpose of this application was to teach me rails through and through, because of this i did not use rails scaffolding.

**Step 1:** $rails new cabinet -d postgresql
**Brief-account:** Run this command to create the shell of your ruby on rails application.


**Step 2:** $rails s. $rails db:create. 
**Brief-account:** launch rails server. Create the database on pgadmin4. (Ensure you have pgadmin/postgresql running before you try to create a database on it). (if a connection error occurs check that you don't have a rails server running elsewhere and/or restart pgadmin4 server).


**Step 2:** Create a repository on GUI github then in the cli of your apps directory run git remote add origin git@github.com:fudomyo-hub/rails_project1_FileCabinet to connect the remote to your local (replace with your own details)
**Brief-account:** If you initialize your repo with a readme.md file then you may get an error saying "“Updates were rejected because the remote contains work that you do not have” when you try to push commits. 

If this is the case then run these two commands to merge history together:
$ git pull --allow-unrelated-histories
$ git push -f origin master


**Step 3:**  *$git remote -v* $add . $git commit -m "Initial Commit" $git push -u origin master.
**Brief-account:** verifiies new remote repository was pulled to local. Add's all git changes to staging area. Commits all the changes. Pushes all commits to the master repo. 


**Step 4:** $heroku create - $git push heroku master - 
**Brief-account:** Create shell of the application on heroku (you will now see that on the dashboard). If you already have heroku configued it will know your git/github work history and be connected to the repo of your rails project. 

I have my heroku configured to pull all working history of an application from my github repo to the heroku platform. After creating an app on heroku to push the repo's files into run the second command so it has the skeloton of the application atleast. This could be left until the entire application is finsihed and i probably should have done it that way to save me running the command again when i finished coding it.


**Step 5:** $rails g controller welcome index - 
**Brief-account:** Creates a welcome controller along with an index view file.


**Step 6:** (in routes.rb)get "welcome/index" & root to: "welcome#index"
**Brief-account:** Sets index view file as the homepage. 


**Step 6:** check if view is correctly routed and displays on the expected browser page by writing some html.haml code in the index.html.haml view file. 


**Step 7.** $rails g model Doc title:string content:text / $rails db:migrate
**Brief-account:** Creates the model(data storage). Include attributes of a document. String data-types have a certain character limit i believe, therefore use the text data-type for the content. 

I like to think of rails db:migrate the same as a 'git push'. It will push all changes to the database to the postgresql/pgadmin4 server and you can see these changes immediately in the schema.rb file.


**Step 8.**  $rails g controller Docs
**Brief-account:** Generates the Docs controller. Remember: Only the model is specified with singular in the MVC model, controllers and views are to always be specified as plurals.

code snippet off the model:
{ class Doc < ApplicationRecord
  #says documents belong to a user (and in user.rb....)
  belongs_to :user
end }


**Step 6:** create crud methods for a document in the Docs controller. (no not a code document silly, the documents that a user will create on the website). (**see code for monstrous detailed comments (i'm getting really tired of typing this all out...))**


**Step 9:** Add instances (instance variables) of the Doc class to the CRUD methods you created in the docs_controller.rb file. Keep your code DRY by only defining the instance variables of the 'Doc' once, inside of a private method. Use this private method in all of the required CRUD methods. I named mine 'doc_params'.


**Step 6:** Add gems to gemfile. run $bundle install
**Brief-account:** Some may say that it is more efficient to just run sudo add gem... but i have already got in the habit of this process.


**Step 6:** rails generate simple_form:install
**Brief-account:** allows the use of simple form gem to create well....simple forms? lol.


**Step 6:** Create a _form partial. Below is a code snippet of the syntax required to create a document with the simple form gem.

{-#--3-- create a document(form) with simple_form gem and use @doc instance variable
-# syntax for creating a form(document) with the simple_form ruby gem 
-# what this does is uses the 'doc' instance variable which is obviously an instance of a document. 
-#says for each doc then create two input fields and a submit button

= simple_form_for @doc do |f|
    = f.input :title 
    = f.input :content 
    = f.button :submit, class: "button" }

#=======================================================================================

END OF THE LINE (sorry). 
I wanted to list out the entire steps in development to consolidate my learning
but this is exruciatingly boring and i really want to get back to coding. 
Please feel free to message me for more detailed info, i will possibly come back 
to this document in a later date to refine this readme.md draft. Thankyou

#======================================================================================


