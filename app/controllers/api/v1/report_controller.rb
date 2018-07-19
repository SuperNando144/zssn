module Api
	module V1
		class ReportController < ApplicationController  
			def percentage_infested_survivors
				@infecteds = Survivor.infected
				if @infecteds
    			 	render json: {status: 'SUCCESS', message:'Porcentagem de Sobreviventes infestados', data:@infecteds},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da porcentagem', data:"Erro"},status: :ok
    			 end
			end

			def percentage_uninfested_survivors
				@uninfecteds = Survivor.uninfected
				if @uninfecteds
    			 	render json: {status: 'SUCCESS', message:'Porcentagem de Sobreviventes infestados', data:@uninfecteds},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da porcentagem', data:"Erro"},status: :ok
    			 end
			end

			def average_resources_by_survivor
				@average = Survivor.average_resources_by_survivor
				if @average
    			 	render json: {status: 'SUCCESS', message:'Media de recursos por sobrevivente', data:@average},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Houve um erro no calculo da media de recursos', data:"Erro"},status: :ok
    			 end
			end

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