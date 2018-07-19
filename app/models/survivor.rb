class Survivor < ApplicationRecord
	 validates_presence_of :name, :age, :gender, :ll_latitude, :ll_longitude, 
	 :infested, :reports, :qt_water, :qt_food, :qt_medication, :qt_ammunition

	 class << self
	 	#Metodo para retornar a porcentagem de sobreviventes infestados
	 	def infected
      		percentage(infecteds.size)
    	end

    	#Metodo para retornar a porcentagem de sobreviventes infestados
    	def uninfected
      		percentage(uninfecteds.size)
    	end

    	#Metodo para retornar a media de recursos por sobrevivente
    	def average_resources_by_survivor
      		average
    	end

    	#Metodo para retornar os pontos perdidos por sobrevivente infestado
    	def points_lost
    		calculate_points_lost
    	end

    private
      #Metodo de calculo de porcentagem
      def percentage(part)
        whole = Survivor.all.size
        return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
      end

      #Metodo que retorna quantidade de sobrevientes infestados
      def infecteds
        where(infested: "Sim")
      end

      #Metodo que retorna quantidade de sobreviventes nao infestados
      def uninfecteds
        where(infested: "Nao")
      end

      #Meotod que calcula os pontos perdidos por causa de sobreviventes infestados
      def calculate_points_lost
      	qtd_sobreviventes = Survivor.all.size
      	pts_positivos = 0
      	pts_negativos = 0
      	i = 1
      	while i <= qtd_sobreviventes
      		sobreviventes = Survivor.find_by_id(i)
      		if is_infected(sobreviventes)
      			pts_negativos += points(sobreviventes)
      		else
      			pts_positivos += points(sobreviventes)
      		end
      	i += 1
      	end
      	return "A quantidade de pontos atualmente eh de #{pts_positivos-pts_negativos}"
      end 

      #Metodo que calcula a media de recursos por sobrevivente
      def average
      	sobreviventes = uninfecteds
      	water = 0
      	food = 0
      	medication = 0
      	ammunition = 0
      	whole =  sobreviventes.all.size

      	sobreviventes.each do |sobrevivente|
      		water = water + sobrevivente["qt_water"].to_f
      		food = food + sobrevivente["qt_food"].to_f
      		medication = medication + sobrevivente["qt_medication"].to_f
      		ammunition = ammunition + sobrevivente["qt_ammunition"].to_f
      	end
      	return "Existem #{whole} sobrevivente(s) não infectado(s),e a media de itens por cada um eh a seguinte: agua - #{water/whole}, alimentos - #{food/whole}, medicamentos - #{medication/whole}, municao - #{ammunition/whole}"
     end

     def is_infected(sobrevivente)
     		if(sobrevivente.infested == "Sim")
     			return true
     		else
     			return false
     		end
     end

     #Metodo que calcula os pontos por recurso
     def points(items)
        water = (items[:qt_water].to_i * 4)
        food = (items[:qt_food].to_i * 3)
        medication = (items[:qt_medication].to_i * 2)
        ammunition = (items[:qt_ammunition].to_i * 1)
        points = water + food + medication + ammunition
        return points
      end
  end

end
