class CoursesController < ApplicationController
  def index
    @courses = Course.all

    render("courses/index.html.erb")
  end

  def my_courses_index
    @courses = Course.all

    render("courses/my_index.html.erb")
  end

  def show
    @course = Course.find(params[:id])

    render("courses/show.html.erb")
  end

  def new
    @course = Course.new

    render("courses/new.html.erb")
  end

  def create
    @course = Course.new

    @course.name = params[:name]
    @course.length = params[:length]
    @course.image_url = params[:image_url]
    @course.user_id = params[:user_id]

    save_status = @course.save

    if save_status == true
      redirect_to("/courses/#{@course.id}", :notice => "Course created successfully.")
    else
      render("courses/new.html.erb")
    end
  end

  def edit
    @course = Course.find(params[:id])

    render("courses/edit.html.erb")
  end

  def update
    @course = Course.find(params[:id])

    @course.name = params[:name]
    @course.image_url = params[:image_url]
    @course.user_id = params[:user_id]

    save_status = @course.save

    if save_status == true
      redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
    else
      render("courses/edit.html.erb")
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    if URI(request.referer).path == "/courses/#{@course.id}"
      redirect_to("/", :notice => "Course deleted.")
    else
      redirect_to(:back, :notice => "Course deleted.")
    end
  end
end
