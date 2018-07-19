class Trade
  class << self
    #Método da troca
    def trade_resources(survivor_1, survivor_2, offered, wanted)
      if infected(survivor_1, survivor_2)
        return "Existem sobreviventes infectados."
      end
      if equal_points(offered, wanted)
        if has_items_to_trade(survivor_1, offered) && has_items_to_trade(survivor_2, wanted)
          trade_items(survivor_1, survivor_2, offered, wanted)
        else
          return "Sobrevivente nao possui esses itens."
        end
      else
        return "Existe uma diferenca de pontos entre os trocadores."
      end
    end

    private
      #Método de consulta de sobrevivente infectado
      def infected(survivor_1, survivor_2)
        if (survivor_1.infested == "Sim" || survivor_2.infested == "Sim")
          return true
        else
          return false
        end
      end

      #Método de comparação de pontos de oferta etroca
      def equal_points(offered, wanted)
        return points(offered) == points(wanted)
      end

      #Método de comparação entre itens que o sobrevivente possui e os que ele está pedindo/dando em troca
      def has_items_to_trade(survivor, items)
        survivor.qt_water >= items[:qt_water].to_i &&
        survivor.qt_food >= items[:qt_food].to_i &&
        survivor.qt_medication >= items[:qt_medication].to_i &&
        survivor.qt_ammunition >= items[:qt_ammunition].to_i
      end

      #Método que sacramenta a troca entre os sobreviventes
      def trade_items(survivor_1, survivor_2, offered, wanted)
        increase_posttrade(survivor_1, wanted)
        increase_posttrade(survivor_2, offered)

        decrease_posttrade(survivor_1, offered)
        decrease_posttrade(survivor_2, wanted)

        survivor_1.save!
        survivor_2.save!

        return "Troca sucedida!"
      end

      #Método de cálculo de pontos
      def points(items)
        water = (items[:qt_water].to_i * 4)
        food = (items[:qt_food].to_i * 3)
        medication = (items[:qt_medication].to_i * 2)
        ammunition = (items[:qt_ammunition].to_i * 1)
        points = water + food + medication + ammunition
        return points
      end

      #Método de incremento de recursos
      def increase_posttrade(survivor, items)
        survivor.qt_water += items[:qt_water].to_i
        survivor.qt_food += items[:qt_food].to_i
        survivor.qt_medication += items[:qt_medication].to_i
        survivor.qt_ammunition += items[:qt_ammunition].to_i
      end

      #Método de decremento de recursos
      def decrease_posttrade(survivor, items)
        survivor.qt_water -= items[:qt_water].to_i
        survivor.qt_food -= items[:qt_food].to_i
        survivor.qt_medication -= items[:qt_medication].to_i
        survivor.qt_ammunition -= items[:qt_ammunition].to_i
      end
  end
end