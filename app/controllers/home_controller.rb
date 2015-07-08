class HomeController < ApplicationController
  def index
    @heroes = Hero.order(:name)
    @str_heroes = @heroes.where(main_attribute: 0)
    @agi_heroes = @heroes.where(main_attribute: 1)
    @int_heroes = @heroes.where(main_attribute: 2)

    gon.names = @heroes.pluck(:name)
  end
end
