class StandardsController < ApplicationController
  def index
    @standards = Standard.all

    render("standards/index.html.erb")
  end

  def show
    @standard = Standard.find(params[:id])

    render("standards/show.html.erb")
  end

  def new
    @standard = Standard.new

    render("standards/new.html.erb")
  end

  def create
    if Standard.find_by(:standard_number => params[:standard_number])!=nil
      redirect_to("/standards/new",alert: "Error: Must create standard using unique standard number.")
    else
      @standard = Standard.new
      #    @lessons_and_standards = Lessons_and_Standards.new

      #    @lessons_and_standards.lesson_id = params[:lesson_id]
      #    @lessons_and_standards.standard_id = @standard.id
      @standard.standard_number = params[:standard_number]
      @standard.program = params[:program]
      @standard.description = params[:description]

      save_status = @standard.save

      if save_status == true
        redirect_to("/standards/#{@standard.id}", :notice => "Standard created successfully.")
      else
        render("standards/new.html.erb")
      end
    end
  end

  def edit
    @standard = Standard.find(params[:id])

    render("standards/edit.html.erb")
  end

  def update
    @standard = Standard.find(params[:id])

    @standard.standard_number = params[:standard_number]
    @standard.program = params[:program]
    @standard.description = params[:description]

    save_status = @standard.save

    if save_status == true
      redirect_to("/standards/#{@standard.id}", :notice => "Standard updated successfully.")
    else
      render("standards/edit.html.erb")
    end
  end

  def destroy
    @standard = Standard.find(params[:id])

    @standard.destroy

    if URI(request.referer).path == "/standards/#{@standard.id}"
      redirect_to("/", :notice => "Standard deleted.")
    else
      redirect_to(:back, :notice => "Standard deleted.")
    end
  end
end
