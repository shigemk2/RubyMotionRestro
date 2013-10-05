class Restaurant
  attr_accessor :name,:thumb_url_image, :food_type, :desc
  def initialize(restaurant)
    @name =restaurant['name']
    @thumb_url_image = restaurant['thumb_url_image']
    @food_type = restaurant['food_type']
    @desc = restaurant['desc']
  end
end
