class DisciplinesController < ApplicationController
  respond_to :json
  
  def index
    respond_with(@disciplines = Discipline.all)
  end
  
  def show
    respond_with(@discipline = Discipline.find(params[:id]))
  end
  
  def create
    respond_with(@discipline = Discipline.create(:name => params[:name],
    :topics => params[:topics]))
  end
  
  def update
    @discipline = Discipline.find(params[:id])
    @discipline.name = params[:name]
    @discipline.topics = params[:topics]    
    @discipline.save
    respond_with(@discipline)
  end
  
  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy
    render(:nothing => true, :status => :ok)
  end
end
