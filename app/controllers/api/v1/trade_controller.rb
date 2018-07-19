module Api
	module V1
		class TradeController < ApplicationController  
			def trade_withsurvivor
				survivor_1 = Survivor.find(params[:survivor_1_id])
    			survivor_2 = Survivor.find(params[:survivor_2_id])

    			 @trade = Trade.trade_resources(survivor_1, survivor_2, params[:offered], params[:wanted])
    			 
    			 if @trade
    			 	render json: {status: 'SUCCESSO', message:'Troca feita', data:@trade},status: :ok
    			 else
    			 	render json: {status: 'ERRO', message:'Troca nao feita', data:"Erro"},status: :ok
    			 end
			end

			 private
			 def trade_params
			 	params.permit(offered: {}, wanted: {})
			 end
		end
	end
end