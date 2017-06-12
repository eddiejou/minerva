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
    @assignment = Assignment.new


    render("lessons/edit.html.erb")
  end

  def update

      #Parameters: {"authenticity_token"=>"05NLXEIEywtAHETBUPF8rMXFpoeUzRCaNLWZ8LJUHjqAZ0NcvxasvqMap7eGvudgqdlyt9Lguu8aOA5vkW3kdA==", "title"=>"Sewing A Pillow", "course_id"=>"7", "standard_id"=>"1", "id"=>"3"}
      @lesson = Lesson.find(params[:id])
      @assignment = Assignment.new
      if LessonsAndStandard.find_by(:standard_id => params[:Tstandard_id], :lesson_id => params[:id])!=nil
        redirect_to("/lessons/#{@lesson.id}/edit", alert: "Error: Cannot use the same standard twice for one lesson.")
      else
      #    @lessons_and_standards = Lessons_and_standards.new

      #    @lessons_and_standards.lesson_id = @lesson.id
      #    @lessons_and_standards.standard_id = params[:standard_id]
      @lesson.title = params[:title]
      if params[:lesson_file]!=nil
        @lesson.lesson_file = params[:lesson_file]
      end
      @lesson.course_id = params[:course_id]
      if params[:Tstandard_id]!=nil
        lesson_connection = LessonsAndStandard.new
        lesson_connection.lesson_id = params[:id]
        lesson_connection.standard_id = params[:Tstandard_id]
        lesson_connection.save
      end
      if params[:remove_standard_id]!=nil
        @removed_connection = LessonsAndStandard.where(:standard_id => params[:remove_standard_id], :lesson_id => params[:id])
        @removed_connection.destroy_all
      end

      save_status = @lesson.save

      if save_status == true
        redirect_to("/lessons/#{@lesson.id}", :notice => "Lesson updated successfully.")
      else
        render("lessons/edit.html.erb")
      end
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
