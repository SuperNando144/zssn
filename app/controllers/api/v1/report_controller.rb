module Api
	module V1
		class ReportController < ApplicationController  
			#Metodo para retornar a porcentagem de sobreviventes infestados
			def percentage_infested_survivors
				@infecteds = Survivor.infected
				if @infecteds
    			 	render json: {status: 'SUCCESS', message:'Porcentagem de Sobreviventes infestados', data:@infecteds},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da porcentagem', data:"Erro"},status: :ok
    			 end
			end

			#Metodo para retornar a porcentagem de sobreviventes nao infestados
			def percentage_uninfested_survivors
				@uninfecteds = Survivor.uninfected
				if @uninfecteds
    			 	render json: {status: 'SUCCESS', message:'Porcentagem de Sobreviventes nao infestados', data:@uninfecteds},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da porcentagem', data:"Erro"},status: :ok
    			 end
			end

			#Metodo para retornar a media de recursos por sobrevivente
			def average_resources_by_survivor
				@average = Survivor.average_resources_by_survivor
				if @average
    			 	render json: {status: 'SUCCESS', message:'Media de recursos por sobrevivente', data:@average},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da media de recursos', data:"Erro"},status: :ok
    			 end
			end

			#Metodo para retornar os pontos perdidos por sobrevivente infestado
			def points_lost
				@points_lost = Survivor.points_lost
				if @points_lost
    			 	render json: {status: 'SUCCESS', message:'Pontos perdidos', data:@points_lost},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo dos pontos perdidos', data:"Erro"},status: :ok
    			 end
			end
		end
	end
end