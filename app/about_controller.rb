class AboutController < UIViewController
  def init
    if super
      self.tabBarItem.title = "About"
      self.tabBarItem.image = UIImage.imageNamed('FirstTab.png')
    end
    super
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Restro Application'
    @label.lineBreakMode = UILineBreakModeWordWrap;
    @label.numberOfLines = 0
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)
  end
end
