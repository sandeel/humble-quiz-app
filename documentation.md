



## Use of Github and pushing the initial application

I generated the Rails application using

    rails new quiz

And a basic controller for a placeholder welcome page:

    cd rails
    bin/rails generate controller welcome index 
    
I created a git repository on my Github account to store the project: https://github.com/sandeel/humble-quiz-app
    
I then initialised a git repository

    git init

And added the remote origin

    git remote add origin git@github.com:sandeel/humble-quiz-app.git
    
I then pushed my initial project to github

    git add -A
    git commit -m "Initial commit"
    git push -u origin master


