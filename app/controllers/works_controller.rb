class WorksController < ApplicationController
  
  def index
    @works = Work.all
  end
  
  def show
    work_id = params[:id].to_i
    @work = Work.find_by(id: work_id)
    if @work.nil?
      head :not_found
      return
    end
  end
  
  def new
    @work = Work.new
  end
  
  def create
    @work = Work.new( work_params )
    if @work.save
      redirect_to work_path(@work.id)
    else
      render new_work_path
    end
  end
  
  def edit
    @work = Work.find_by(id: params[:id] )
    if @work.nil?
      redirect_to works_path
      return
    end
  end
  
  def update
    @work = Work.find_by(id: params[:id] )
    if @work.nil?
      head :not_found
      return
    elsif @work.update( work_params )
      redirect_to work_path(@work.id)
    else
      render :edit
    end
  end
  
  def destroy
    
    @work = Work.find_by( id: params[:id] )
    
    if @work.nil?
      redirect_to works_path
      return
    else
      @work.destroy
      redirect_to works_path
      return
    end
  end
  
  private             
  
  def work_params
    return params.require(:work).permit(:name, :category, :title, :creator, :publication_year, :description)
  end
end
