class Survivor < ApplicationRecord
	 validates_presence_of :name, :age, :gender, :ll_latitude, :ll_longitude, 
	 :infested, :reports, :qt_water, :qt_food, :qt_medication, :qt_ammunition

	 class << self
	 	def infected
      		percentage(infecteds.size)
    	end

    	def uninfected
      		percentage(uninfecteds.size)
    	end

    	def average_resources_by_survivor
      		average
    	end

    	def points_lost
    		calculate_points_lost
    	end

    private
      def percentage(part)
        whole = Survivor.all.size
        return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
      end

      def infecteds
        where(infested: "Sim")
      end

      def uninfecteds
        where(infested: "Nao")
      end

      def calculate_points_lost
      	qtd_sobreviventes = Survivor.all.size
      	pts_positivos = 0
      	pts_negativos = 0
      	i = 1
      	while i <= qtd_sobreviventes
      		sobreviventes = Survivor.find_by_id(i)
      		if sobreviventes.infested == "Sim"
      			pts_negativos += points(sobreviventes)
      		else
      			pts_positivos += points(sobreviventes)
      		end
      	i += 1
      	end
      	return "A quantidade de pontos atualmente eh de #{pts_positivos-pts_negativos}"
      end 

      def average
       	whole = Survivor.all.size
        water = Survivor.sum(:qt_water)
        food = Survivor.sum(:qt_food)
        medication = Survivor.sum(:qt_medication)
        ammunition= Survivor.sum(:qt_ammunition)

        return "Existem #{whole} sobreviventes,e a media de itens por cada um eh a seguinte: agua - #{water/whole}, 
        alimentos - #{food/whole}, medicamentos - #{medication/whole}, municao - #{ammunition/whole}"
     end

     def points(items)
        water = (items[:qt_water].to_i * 4)
        food = (items[:qt_food].to_i * 3)
        medication = (items[:qt_medication].to_i * 2)
        ammunition = (items[:qt_ammunition].to_i * 1)
        points = water + food + medication + ammunition
        return points
      end
  end

  private
    def points
      qt_water, qt_food, qt_med, qt_ammo = self.inventory.values_at(:qt_water, :qt_food, :qt_medication, :qt_ammunition)
      self.points = (qt_water.to_i * 4) + (qt_food.to_i * 3) + (qt_med.to_i * 2) + (qt_ammo.to_i * 1)
    end

end
