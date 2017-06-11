class LessonCommentsController < ApplicationController
  def index
    @lesson_comments = LessonComment.all

    render("lesson_comments/index.html.erb")
  end

  def show
    @lesson_comment = LessonComment.find(params[:id])

    render("lesson_comments/show.html.erb")
  end

  def new
    @lesson_comment = LessonComment.new

    render("lesson_comments/new.html.erb")
  end

  def create
    @lesson_comment = LessonComment.new

    @lesson_comment.lesson_id = params[:lesson_id]
    @lesson_comment.body = params[:body]
    @lesson_comment.user_id = params[:user_id]

    save_status = @lesson_comment.save!   
    @lesson_comment.errors

    if save_status == true
      redirect_to("/lessons/#{params[:lesson_id]}}", :notice => "Lesson comment created successfully.")
    else
      redirect_to("/lessons/#{params[:lesson_id]}}", :notice => "Comment unsuccessful.")
    end
  end

  def edit
    @lesson_comment = LessonComment.find(params[:id])

    render("lesson_comments/edit.html.erb")
  end

  def update
    @lesson_comment = LessonComment.find(params[:id])

    @lesson_comment.lesson_id = params[:lesson_id]
    @lesson_comment.body = params[:body]
    @lesson_comment.user_id = params[:user_id]

    save_status = @lesson_comment.save

    if save_status == true
      redirect_to("/lesson_comments/#{@lesson_comment.id}", :notice => "Lesson comment updated successfully.")
    else
      render("lesson_comments/edit.html.erb")
    end
  end

  def destroy
    @lesson_comment = LessonComment.find(params[:id])

    @lesson_comment.destroy

    if URI(request.referer).path == "/lesson_comments/#{@lesson_comment.id}"
      redirect_to("/", :notice => "Lesson comment deleted.")
    else
      redirect_to(:back, :notice => "Lesson comment deleted.")
    end
  end
end
