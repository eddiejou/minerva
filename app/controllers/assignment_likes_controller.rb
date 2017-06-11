class AssignmentLikesController < ApplicationController
  def index
    @assignment_likes = AssignmentLike.all

    render("assignment_likes/index.html.erb")
  end

  def show
    @assignment_like = AssignmentLike.find(params[:id])

    render("assignment_likes/show.html.erb")
  end

  def new
    @assignment_like = AssignmentLike.new

    render("assignment_likes/new.html.erb")
  end

  def create
    @assignment_like = AssignmentLike.new

    @assignment_like.user_id = params[:user_id]
    @assignment_like.assignment_id = params[:assignment_id]

    save_status = @assignment_like.save

    if save_status == true
      redirect_to("/assignments/#{params[:assignment_id]}", :notice => "Assignment like created successfully.")
    else
      redirect_to("/assignments/#{params[:assignment_id]}", :notice => "Assignment like not successful.")
    end
  end

  def edit
    @assignment_like = AssignmentLike.find(params[:id])

    render("assignment_likes/edit.html.erb")
  end

  def update
    @assignment_like = AssignmentLike.find(params[:id])

    @assignment_like.user_id = params[:user_id]
    @assignment_like.assignment_id = params[:assignment_id]

    save_status = @assignment_like.save

    if save_status == true
      redirect_to("/assignment_likes/#{@assignment_like.id}", :notice => "Assignment like updated successfully.")
    else
      render("assignment_likes/edit.html.erb")
    end
  end

  def destroy
    @assignment_like = AssignmentLike.find(params[:id])

    @assignment_like.destroy
    
    redirect_to(:back, :notice => "Assignment like deleted.")
  end
end
