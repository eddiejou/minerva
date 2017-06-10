class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all

    render("lessons/index.html.erb")
  end

  def my_lessons_index
    @lessons = Lesson.all

    render("lessons/my_lessons_index.html.erb")
  end

  def show
    @lesson = Lesson.find(params[:id])

    render("lessons/show.html.erb")
  end

  def new
    @lesson = Lesson.new
    render("lessons/new.html.erb")
  end

  def new_with_id
    @lesson = Lesson.new
    @lesson.course_id = params[:id]
    render("lessons/new_with_id.html.erb")
  end

  def create
    @lesson = Lesson.new

    @lesson.title = params[:title]
    @lesson.lesson_file = params[:lesson_file]
    @lesson.course_id = params[:course_id]

    save_status = @lesson.save

    if save_status == true
      redirect_to("/lessons/#{@lesson.id}", :notice => "Lesson created successfully.")
    else
      render("lessons/new.html.erb")
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])

    render("lessons/edit.html.erb")
  end

  def update
    @lesson = Lesson.find(params[:id])

    @lesson.title = params[:title]
    @lesson.lesson_file = params[:lesson_file]
    @lesson.course_id = params[:course_id]

    save_status = @lesson.save

    if save_status == true
      redirect_to("/lessons/#{@lesson.id}", :notice => "Lesson updated successfully.")
    else
      render("lessons/edit.html.erb")
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])

    @lesson.destroy

    if URI(request.referer).path == "/courses/#{@lesson.id}"
      redirect_to("/", :notice => "Lesson deleted.")
    else
      redirect_to(:back, :notice => "Lesson deleted.")
    end
  end
end
