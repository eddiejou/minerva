class LessonLikesController < ApplicationController
  def index
    @lesson_likes = LessonLike.all

    render("lesson_likes/index.html.erb")
  end

  def show
    @lesson_like = LessonLike.find(params[:id])

    render("lesson_likes/show.html.erb")
  end

  def new
    @lesson_like = LessonLike.new

    render("lesson_likes/new.html.erb")
  end

  def create
    @lesson_like = LessonLike.new

    @lesson_like.user_id = params[:user_id]
    @lesson_like.lesson_id = params[:lesson_id]

    save_status = @lesson_like.save

    if save_status == true
      redirect_to("/lessons/#{params[:lesson_id]}", :notice => "Lesson like created successfully.")
    else
      render("lessons/#{params[:lesson_id]}")
    end
  end

  def edit
    @lesson_like = LessonLike.find(params[:id])

    render("lesson_likes/edit.html.erb")
  end

  def update
    @lesson_like = LessonLike.find(params[:id])

    @lesson_like.user_id = params[:user_id]
    @lesson_like.lesson_id = params[:lesson_id]

    save_status = @lesson_like.save

    if save_status == true
      redirect_to("/lesson_likes/#{@lesson_like.id}", :notice => "Lesson like updated successfully.")
    else
      render("lesson_likes/edit.html.erb")
    end
  end

  def destroy
    @lesson_like = LessonLike.find(params[:id])

    @lesson_like.destroy

    redirect_to(:back, :notice => "Lesson like deleted.")

  end
end
