class HeroesController < ApplicationController
  before_action :set_hero, only: [:show]

  def index
    @heroes = Hero.order(:name)
    @str_heroes = @heroes.where(main_attribute: 0)
    @agi_heroes = @heroes.where(main_attribute: 1)
    @int_heroes = @heroes.where(main_attribute: 2)
  end

  def show
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    if @hero.save
      redirect_to @hero
    else
      render 'new'
    end
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :dota_id)
  end
end
