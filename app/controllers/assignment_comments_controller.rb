class AssignmentCommentsController < ApplicationController
  def index
    @assignment_comments = AssignmentComment.all

    render("assignment_comments/index.html.erb")
  end

  def show
    @assignment_comment = AssignmentComment.find(params[:id])

    render("assignment_comments/show.html.erb")
  end

  def new
    @assignment_comment = AssignmentComment.new

    render("assignment_comments/new.html.erb")
  end

  def create
    @assignment_comment = AssignmentComment.new

    @assignment_comment.assignment_id = params[:assignment_id]
    @assignment_comment.body = params[:body]
    @assignment_comment.user_id = params[:user_id]

    save_status = @assignment_comment.save

    if save_status == true
      redirect_to("/assignments/#{params[:assignment_id]}", :notice => "Assignment comment created successfully.")
    else
      redirect_to("/assignments/#{params[:assignment_id]}", :notice => "Assignment unsuccessful.")
    end
  end

  def edit
    @assignment_comment = AssignmentComment.find(params[:id])

    render("assignment_comments/edit.html.erb")
  end

  def update
    @assignment_comment = AssignmentComment.find(params[:id])

    @assignment_comment.assignment_id = params[:assignment_id]
    @assignment_comment.body = params[:body]
    @assignment_comment.user_id = params[:user_id]

    save_status = @assignment_comment.save

    if save_status == true
      redirect_to("/assignment_comments/#{@assignment_comment.id}", :notice => "Assignment comment updated successfully.")
    else
      render("assignment_comments/edit.html.erb")
    end
  end

  def destroy
    @assignment_comment = AssignmentComment.find(params[:id])

    @assignment_comment.destroy

    if URI(request.referer).path == "/assignment_comments/#{@assignment_comment.id}"
      redirect_to("/", :notice => "Assignment comment deleted.")
    else
      redirect_to(:back, :notice => "Assignment comment deleted.")
    end
  end
end
