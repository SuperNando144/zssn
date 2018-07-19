Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :survivors, except: [:destroy] do
    	get 'report_infested_survivor', on: :member
  		end
  		get '/percentage_infested_survivors', to: 'report#percentage_infested_survivors'
  		get '/percentage_uninfested_survivors', to: 'report#percentage_uninfested_survivors'
  		get '/average_resources_by_survivor', to: 'report#average_resources_by_survivor'
  		get '/points_lost', to: 'report#points_lost'
  		post '/trade/:survivor_1_id/with/:survivor_2_id', to: 'trade#trade_withsurvivor'
  	end
  end
end
