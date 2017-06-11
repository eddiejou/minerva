Rails.application.routes.draw do
  # Routes for the Assignment_comment resource:
  # CREATE
  get "/assignment_comments/new", :controller => "assignment_comments", :action => "new"
  post "/create_assignment_comment", :controller => "assignment_comments", :action => "create"

  # READ
  get "/assignment_comments", :controller => "assignment_comments", :action => "index"
  get "/assignment_comments/:id", :controller => "assignment_comments", :action => "show"

  # UPDATE
  get "/assignment_comments/:id/edit", :controller => "assignment_comments", :action => "edit"
  post "/update_assignment_comment/:id", :controller => "assignment_comments", :action => "update"

  # DELETE
  get "/delete_assignment_comment/:id", :controller => "assignment_comments", :action => "destroy"
  #------------------------------

  # Routes for the Assignment_like resource:
  # CREATE
  get "/assignment_likes/new", :controller => "assignment_likes", :action => "new"
  post "/create_assignment_like", :controller => "assignment_likes", :action => "create"

  # READ
  get "/assignment_likes", :controller => "assignment_likes", :action => "index"
  get "/assignment_likes/:id", :controller => "assignment_likes", :action => "show"

  # UPDATE
  get "/assignment_likes/:id/edit", :controller => "assignment_likes", :action => "edit"
  post "/update_assignment_like/:id", :controller => "assignment_likes", :action => "update"

  # DELETE
  get "/delete_assignment_like/:id", :controller => "assignment_likes", :action => "destroy"
  #------------------------------

  # Routes for the Lesson_comment resource:
  # CREATE
  get "/lesson_comments/new", :controller => "lesson_comments", :action => "new"
  post "/create_lesson_comment", :controller => "lesson_comments", :action => "create"

  # READ
  get "/lesson_comments", :controller => "lesson_comments", :action => "index"
  get "/lesson_comments/:id", :controller => "lesson_comments", :action => "show"

  # UPDATE
  get "/lesson_comments/:id/edit", :controller => "lesson_comments", :action => "edit"
  post "/update_lesson_comment/:id", :controller => "lesson_comments", :action => "update"

  # DELETE
  get "/delete_lesson_comment/:id", :controller => "lesson_comments", :action => "destroy"
  #------------------------------

  # Routes for the Lesson_like resource:
  # CREATE
  get "/lesson_likes/new", :controller => "lesson_likes", :action => "new"
  post "/create_lesson_like", :controller => "lesson_likes", :action => "create"

  # READ
  get "/lesson_likes", :controller => "lesson_likes", :action => "index"
  get "/lesson_likes/:id", :controller => "lesson_likes", :action => "show"

  # UPDATE
  get "/lesson_likes/:id/edit", :controller => "lesson_likes", :action => "edit"
  post "/update_lesson_like/:id", :controller => "lesson_likes", :action => "update"

  # DELETE
  get "/delete_lesson_like/:id", :controller => "lesson_likes", :action => "destroy"
  #------------------------------

  # Routes for the Assignment resource:
  # CREATE

  devise_for :users
  root 'courses#my_courses_index'

  get "/assignments/new", :controller => "assignments", :action => "new"
  post "/create_assignment", :controller => "assignments", :action => "create"

  # READ
  get "/assignments", :controller => "assignments", :action => "index"
  get "/assignments/:id", :controller => "assignments", :action => "show"

  # UPDATE
  get "/assignments/:id/edit", :controller => "assignments", :action => "edit"
  post "/update_assignment/:id", :controller => "assignments", :action => "update"

  # DELETE
  get "/delete_assignment/:id", :controller => "assignments", :action => "destroy"
  #------------------------------

  # Routes for the Lessons_and_standard resource:
  # CREATE
  get "/lessons_and_standards/new", :controller => "lessons_and_standards", :action => "new"
  post "/create_lessons_and_standard", :controller => "lessons_and_standards", :action => "create"

  # READ
  get "/lessons_and_standards", :controller => "lessons_and_standards", :action => "index"
  get "/lessons_and_standards/:id", :controller => "lessons_and_standards", :action => "show"

  # UPDATE
  get "/lessons_and_standards/:id/edit", :controller => "lessons_and_standards", :action => "edit"
  post "/update_lessons_and_standard/:id", :controller => "lessons_and_standards", :action => "update"

  # DELETE
  get "/delete_lessons_and_standard/:id", :controller => "lessons_and_standards", :action => "destroy"
  #------------------------------

  # Routes for the Standard resource:
  # CREATE
  get "/standards/new", :controller => "standards", :action => "new"
  post "/create_standard", :controller => "standards", :action => "create"

  # READ
  get "/standards", :controller => "standards", :action => "index"
  get "/standards/:id", :controller => "standards", :action => "show"

  # UPDATE
  get "/standards/:id/edit", :controller => "standards", :action => "edit"
  post "/update_standard/:id", :controller => "standards", :action => "update"

  # DELETE
  get "/delete_standard/:id", :controller => "standards", :action => "destroy"
  #------------------------------

  # Routes for the Lesson resource:
  # CREATE
  get "/lessons/new/:id", :controller => "lessons", :action => "new_with_id"
  get "/lessons/new", :controller => "lessons", :action => "new"
  post "/create_lesson", :controller => "lessons", :action => "create"

  # READ
  get "/lessons", :controller => "lessons", :action => "index"
  get "/my_lessons_index", :controller => "lessons", :action => "my_lessons_index"
  get "/lessons/:id", :controller => "lessons", :action => "show"

  # UPDATE
  get "/lessons/:id/edit", :controller => "lessons", :action => "edit"
  post "/update_lesson/:id", :controller => "lessons", :action => "update"

  # DELETE
  get "/delete_lesson/:id", :controller => "lessons", :action => "destroy"
  #------------------------------

  # Routes for the Course resource:
  # CREATE
  get "/courses/new", :controller => "courses", :action => "new"
  post "/create_course", :controller => "courses", :action => "create"

  # READ
  get "/courses", :controller => "courses", :action => "index"
  get "/courses/:id/index", :controller => "courses", :action => "my_courses_index"
  get "/my_courses_index", :controller => "courses", :action => "my_courses_index"
  get "/courses/:id", :controller => "courses", :action => "show"

  # UPDATE
  get "/courses/:id/edit", :controller => "courses", :action => "edit"
  post "/update_course/:id", :controller => "courses", :action => "update"

  # DELETE
  get "/delete_course/:id", :controller => "courses", :action => "destroy"
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"
  get "/my_likes", :controller => "users", :action => "my_likes"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------
  # Routes for the lesson_comments resource:
  # CREATE
  post "/create_comment", :controller => "lesson_comments", :action => "create"

  #------------------------------
  # Routes for the lesson_likes resource:
  # DELETE
  get "/delete_like/:id", :controller => "lesson_likes", :action => "destroy"

  # CREATE
  post "/create_like", :controller => "lesson_likes", :action => "create"
  #------------------------------
  # Routes for the assignment_comment resource:
  # CREATE
  post "/create__assignment_comment", :controller => "assignment_comment", :action => "create"
  #------------------------------
  # Routes for the assignment_likes resource:
  # DELETE
  get "/delete_assignment_like/:id", :controller => "assignment_likes", :action => "destroy"

  # CREATE
  post "/create_assignment_like", :controller => "assignment_likes", :action => "create"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
