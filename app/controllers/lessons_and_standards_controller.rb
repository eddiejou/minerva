class LessonsAndStandardsController < ApplicationController
  def index
    @lessons_and_standards = LessonsAndStandard.all

    render("lessons_and_standards/index.html.erb")
  end

  def show
    @lessons_and_standard = LessonsAndStandard.find(params[:id])

    render("lessons_and_standards/show.html.erb")
  end

  def new
    @lessons_and_standard = LessonsAndStandard.new

    render("lessons_and_standards/new.html.erb")
  end

  def create
    @lessons_and_standard = LessonsAndStandard.new

    @lessons_and_standard.lesson_id = params[:lesson_id]
    @lessons_and_standard.standard_id = params[:standard_id]

    save_status = @lessons_and_standard.save

    if save_status == true
      redirect_to("/lessons_and_standards/#{@lessons_and_standard.id}", :notice => "Lessons and standard created successfully.")
    else
      render("lessons_and_standards/new.html.erb")
    end
  end

  def edit
    @lessons_and_standard = LessonsAndStandard.find(params[:id])

    render("lessons_and_standards/edit.html.erb")
  end

  def update
    @lessons_and_standard = LessonsAndStandard.find(params[:id])

    @lessons_and_standard.lesson_id = params[:lesson_id]
    @lessons_and_standard.standard_id = params[:standard_id]

    save_status = @lessons_and_standard.save

    if save_status == true
      redirect_to("/lessons_and_standards/#{@lessons_and_standard.id}", :notice => "Lessons and standard updated successfully.")
    else
      render("lessons_and_standards/edit.html.erb")
    end
  end

  def destroy
    @lessons_and_standard = LessonsAndStandard.find(params[:id])

    @lessons_and_standard.destroy

    if URI(request.referer).path == "/lessons_and_standards/#{@lessons_and_standard.id}"
      redirect_to("/", :notice => "Lessons and standard deleted.")
    else
      redirect_to(:back, :notice => "Lessons and standard deleted.")
    end
  end
end
