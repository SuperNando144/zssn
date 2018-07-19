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

       def average
       	whole = Survivor.all.size
        water = Survivor.sum(:qt_water)
        food = Survivor.sum(:qt_food)
        medication = Survivor.sum(:qt_medication)
        ammunition= Survivor.sum(:qt_ammunition)

        return "Existem #{whole} sobreviventes,e a media de itens por cada um eh a seguinte: agua - #{water/whole}, alimentos - #{food/whole}, medicamentos - #{medication/whole}, municao - #{ammunition/whole}"
      end
  end

  private
    def points
      qt_water, qt_food, qt_med, qt_ammo = self.inventory.values_at(:qt_water, :qt_food, :qt_medication, :qt_ammunition)
      self.points = (qt_water.to_i * 4) + (qt_food.to_i * 3) + (qt_med.to_i * 2) + (qt_ammo.to_i * 1)
    end

end
