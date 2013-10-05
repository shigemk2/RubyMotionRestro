class DetailController < UIViewController
  attr_accessor :restaurant
  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    show_restaurant_detail
  end

  def show_restaurant_detail
    label = UILabel.alloc.init
    label.frame = [[120,20],[300,30]]
    label.backgroundColor = UIColor.clearColor
    label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold", size:22)
    label.text = @restaurant.name
    view.addSubview(label)

    image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@restaurant.thumb_url_image)))
    view.addSubview(UIImageView.alloc.initWithImage(image))

    label = UILabel.alloc.init
    label.frame = [[20,100],[300,30]]
    label.backgroundColor = UIColor.clearColor
    label.font = UIFont.fontWithName("HelveticaNeue-CondensedBold", size:15)
    label.text = @restaurant.desc
    view.addSubview(label)
  end
end
