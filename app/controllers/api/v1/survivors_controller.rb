module Api
	module V1
		class SurvivorsController < ApplicationController  
		 before_action :set_survivor, only: [:show, :update, :report_infested_survivor]
		 	
		# Listar todos os sobreviventes
			def index
				@sobreviventes = Survivor.order('created_at DESC');
				render json: {status: 'SUCCESSO', message:'Sobreviventes', data:@sobreviventes},status: :ok
			end 

		# Listar sobreviventes por ID
			def show
				render json: {status: 'SUCCESSO', message:'Sobreviventes', data:@sobreviventes},status: :ok
			end

		# Criar um novo sobreviventes
			def create
				@sobreviventes = Survivor.new(sobreviventes_params)
				if @sobreviventes.save
					render json: {status: 'SUCCESSO', message:'Sobrevivente salvo', data:@sobreviventes},status: :ok
				else
					render json: {status: 'ERRO', message:'Sobrevivente nao salvo. Todos os parametros devem ser preenchidos.', data:"Erro"},status: :unprocessable_entity
				end
			end

		# Atualizar coordenadas sobrevivente
			def update
				if @sobreviventes.update_attributes(sobreviventes_params)
					render json: {status: 'SUCCESSO', message:'Coordenadas atualizadas', data:@sobreviventes},status: :ok
				else
					render json: {status: 'ERRO', message:'Erro ao atualizar coordenadas', data:"Erro"},status: :unprocessable_entity
				end
			end

			# Reportar infectados	
			def report_infested_survivor
    			if @sobreviventes.increment!(:reports)
    				if @sobreviventes.reports > 2
      					@sobreviventes.infested = "Sim"
    				end
    				@sobreviventes.save
    				render json: {status: 'SUCCESSO', message:'Infestação reportada', data:@sobreviventes},status: :ok
    			else
    				render json: {status: 'ERRO', message:'Erro ao reportar infestação', data:"Erro"},status: :unprocessable_entity
    			end
  			end

  			private
  			# Setar o sobrevivente por ID
  			def set_survivor
  				@sobreviventes = Survivor.find(params[:id])
  			end
  			# Parametros aceitos
  			def sobreviventes_params
				params.permit(:name, :age, :gender, :ll_latitude, :ll_longitude, :infested, :reports, :qt_water, :qt_food, :qt_medication, :qt_ammunition)
			end

		end
	end
end