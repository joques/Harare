class DisciplinesController < ApplicationController
  respond_to :json
  
  def index
    respond_with(@disciplines = Discipline.all)
  end
  
  def show
    respond_with(@discipline = Discipline.find(params[:id]))
  end
  
  def create
    @discipline = Discipline.create! :name => params[:name]
    respond_with(@discipline)
  end
  
  def update
    @discipline = Discipline.find(params[:id])
    @discipline.update_attributes(:name => params[:name])
    respond_with(@discipline)
  end
  
  def destroy
    @discipline = Discipline.find(params[:id])
    @discipline.destroy
    render(:nothing => true, :status => :ok)
  end
end
