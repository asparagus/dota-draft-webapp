module HeroesHelper
  def attribute_icon(index)
    case index
    when 0
      "Icon_Str.png"
    when 1
      "Icon_Agi.png"
    when 2
      "Icon_Int.png"
    end
  end
end
