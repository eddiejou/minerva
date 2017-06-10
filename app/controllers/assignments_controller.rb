class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all

    render("assignments/index.html.erb")
  end

  def show
    @assignment = Assignment.find(params[:id])

    render("assignments/show.html.erb")
  end

  def new
    @assignment = Assignment.new

    render("assignments/new.html.erb")
  end

  def create
    @assignment = Assignment.new

    @assignment.title = params[:title]
    @assignment.assignment_file = params[:assignment_file]
    @assignment.lesson_id = params[:lesson_id]
    @assignment.lesson.course.id = params[:course_id]

    save_status = @assignment.save

    if save_status == true
      redirect_to("/assignments/#{@assignment.id}", :notice => "Assignment created successfully.")
    else
      render("assignments/new.html.erb")
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])

    render("assignments/edit.html.erb")
  end

  def update
    @assignment = Assignment.find(params[:id])

    @assignment.title = params[:title]
    @assignment.assignment_file = params[:assignment_file]
    @assignment.lesson_id = params[:lesson_id]

    save_status = @assignment.save

    if save_status == true
      redirect_to("/assignments/#{@assignment.id}", :notice => "Assignment updated successfully.")
    else
      render("assignments/edit.html.erb")
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])

    @assignment.destroy

    if URI(request.referer).path == "/assignments/#{@assignment.id}"
      redirect_to("/", :notice => "Assignment deleted.")
    else
      redirect_to(:back, :notice => "Assignment deleted.")
    end
  end
end
