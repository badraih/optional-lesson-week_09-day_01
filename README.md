# Build Stack Overflow Clone

![stackOverflow](https://pics.me.me/i-dont-but-when-i-do-i-google-stackoverflow-stack-21431262.png)

# What is Stack Overflow

Stack Overflow let users ask questions and other users answer them. Users of the site can vote on answers which are organized based on the number of votes they have. The higher the vote, the higher the answer is on the page.

![screenshots_1](/screenshots/1.png)
![screenshots_2](/screenshots/2.png)

# Planning

Creating a plan is an excellent place to start when building a project. The more well thought out your interface is, the easier it will be for other developers to understand, Let’s start by getting an overview of how we want to build, and then do a little planning to bring it all to life.

<table style="display:inline">

  <tr>
    <td>Verbs</td>
    <td>Nouns</td>
  </tr>

  <tr>
    <td>Ask</td>
    <td>Questions</td>
  </tr>

  <tr>
    <td>Read</td>
    <td>Answers</td>
  </tr>

   <tr>
    <td>Vote</td>
    <td></td>
  </tr>
</table>

# Questions

### User Stories

- Version 1:
  - As a user, I want to ask a question
  - As a user, I want to view all questions
  - As a user, I want to Read a question

<table>
  <th colspan="2" style="text-align:center">Questions</th>

  <tr>
    <td>HTTP Verp</td>
    <td>Path</td>
    <td>Controller#Action</td>
    <td>Used for</td>
  </tr>

  <tr>
    <td>GET</td>
    <td>/questions</td>
    <td>QuestionsController#index</td>
    <td>display a form to add new Questions and display a list of all Questions </td>
  </tr>

  <tr>
    <td>POST</td>
    <td>/questions</td>
    <td>QuestionsController#create</td>
    <td>To add a new Question</td>
  </tr>

</table>

### Question TABLE

<table>
  <th colspan="2" style="text-align:center">Questions</th>

  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>

  <tr>
    <td>text</td>
    <td>string</td>
  </tr>

  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>

  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>

</table>

# Answers

### User Stories

- Version 1:

  - As a user, I want to Answer a question
  - As a user, I want to edit an Answer
  - As a user, I want to delete an Answer
  - As a user, I want to read all the answers for a question
  - As a user, I want to up vote or down vote an answer

<table>

  <th colspan="2" style="text-align:center">Questions</th>
  
  <tr>
    <td>HTTP Verp</td>
    <td>Path</td>
    <td>Controller#Action</td>
    <td>Used for</td>
  </tr>

  <tr>
    <td>GET</td>
    <td>/questions/:id/answers</td>
    <td>AnswersController#index</td>
    <td>Display a form to add new Answer and display a list of all Answers for a question </td>
  </tr>

  <tr>
    <td>POST</td>
    <td>/questions/:id/answers</td>
    <td>AnswersController#create</td>
    <td>to create a new answer</td>
  </tr>

  <tr>
    <td>GET</td>
    <td>/questions/:qID/answers/:aID/edit</td>
    <td>AnswersController#edit</td>
    <td>Return an HTML form for editing an answer </td>
  </tr>

  <tr>
    <td>PATCH/PUT</td>
    <td>/questions/:qID/answers/:aID</td>
    <td>AnswersController#update</td>
    <td>to update an Answer </td>
  </tr>

  <tr>
    <td>DELETE</td>
    <td>/questions/:qID/answers/:aID</td>
    <td>AnswersController#destroy</td>
    <td>to delete an Answer</td>
  </tr>

  <tr>
    <td>PATCH/PUT</td>
    <td>/questions/:qID/answers/:aID/vote-up</td>
    <td>AnswersController#upvote</td>
    <td>to up vote an answer</td>
  </tr>

  <tr>
    <td>PATCH/PUT</td>
    <td>/questions/:qID/answers/:aID/vote-down</td>
    <td>AnswersController#downvote</td>
    <td>to down vote an answer</td>
  </tr>

</table>

### Answer Tables

<table>
  <th colspan="2" style="text-align:center">Questions</th>
  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>
  <tr>
    <td>text</td>
    <td>string</td>
  </tr>
    <tr>
    <td>vote</td>
    <td>integer</td>
  </tr>
  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>
</table>

# Lets code !

## Creating new app

```
rails new stack_clone --skip-turbolinks --skip-coffee  --database=postgresql
```

## Creating the resources

### Generate Models

```
rails g model Question text:string

rails g model Answer text:string vote:integer question:references
```

You'll need to edit app/models/question.rb to add the other side of the association:

```rb
class Question < ApplicationRecord
  has_many :answers
end
```

You'll need to edit db/migrate/2019xxxxx_create_answers.rb to add default value got the vote column

```rb
  t.integer :vote,  :default => 0
```

```
rails db:create
rails db:migrate
```

### Config Routes and Generating Paths and URLs

```rb
  get    '/',              to: 'questions#index',   as: 'question_index'
  post   '/questions',     to: 'questions#create',  as: 'question_create'

  get    '/questions/:qID/answers',                to: 'answers#index',    as: 'answers_index'
  post   '/questions/:qID/answers',                to: 'answers#create',   as: 'answer_create'
  get    '/questions/:qID/answers/:aID/edit',      to: 'answers#edit',     as: 'answer_edit'
  put    '/questions/:qID/answers/:aID',           to: 'answers#update',   as: 'answer_update'
  delete '/questions/:qID/answers/:aID',           to: 'answers#destroy',  as: 'answer_destroy'
  put    '/questions/:qID/answers/:aID/vote', to: 'answers#downvote', as: 'vote_update'
```

### edit the controller

### Generate Controller

```
rails g controller Questions index create
rails g controller Answers index new create edit update destroy vote
```

# Adding Bootstrap

## The Gemfile

As the JavaScript in Bootstrap is dependent on JQuery, you need to ensure this is included as well. Add the following gems to your Gemfile:

```
gem 'bootstrap'
```

run

```
bundle install
```

1. Rename app/assets/stylesheets/application.css to application.scss.
2. Use the syntax @import to import Sass files and include @import ‘bootstrap’; then save and exit.

# Solving the JS file problem

go to app/views/layouts/application.html.erb and move

```erb
<%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
```

to the bottom of the body tag

# SKIPING the authenticity_token in the contoller

just add

```
skip_before_action :verify_authenticity_token
```
