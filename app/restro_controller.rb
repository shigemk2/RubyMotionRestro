class RestroController < UITableViewController
  def viewDidLoad
    super
    @restaurants = []
    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
    view.dataSource = view.delegate = self
    searchBar.text = 'Chicago'

    searchBarSearchButtonClicked(searchBar)

  end
  def searchBarSearchButtonClicked(searchBar)
    query = searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = "http://restro.nalwaya.com/restaurants/search.json?city=#{query}"
    @restaurants.clear
    json = nil
    begin
      json = JSONParser.parse_from_url(url)
    rescue RuntimeError => e
      presentError e.message
    end

    @restaurants = []
    json.each do |restaurant|
      @restaurants << Restaurant.new(restaurant)
    end

    view.reloadData
    searchBar.resignFirstResponder
  end
  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
  def tableView(tableView, numberOfRowsInSection:section)
    @restaurants.count 
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)

    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
                                                                              UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
                                                                            end
    cell.textLabel.text = @restaurants[indexPath.row].name
    cell.detailTextLabel.text=  @restaurants[indexPath.row].desc
    
    cell.imageView.image = UIImage.alloc.initWithData(NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(@restaurants[indexPath.row].thumb_url_image)))
    
    cell
  end

end
