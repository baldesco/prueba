class RegistrosController < ApplicationController

	before_action :load_registro, only:[:show, :edit, :update, :destroy]  
	#clients/index

  #respond_to :html, :json, :xml
  def index
  	@registros=Registro.all
  	#puts "#{@clients.inspect}"
  end

  #users/123
  def show
  end

  #clients/new
  def new
	@registro=Registro.new  	
  end

  #clients/create
  def create
  	params_filtered=params.require(:registro).permit(:name,:email)
  	@registro=Registro.new(params_filtered)
  	if @registro.save
  		redirect_to registros_path
  	else
  		render 'new'
  	end

  end

  def edit
    #@client = Client.find(params[:id])
  end

  #clients/update
  def update
    params_filtered=params.require(:registro).permit(:name,:email)
    if @registro.update(params_filtered)
      redirect_to registros_path
    else
      render 'edit'
    end
  end

  def destroy
    @registro.destroy
    redirect_to user_path, notice: 'Usuario eliminado'
  end

  def load_registro
    begin
      @registro = Registro.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to registros_path, 
        notice: 'El usuario no existe en el sistema'
    end
  end

end
