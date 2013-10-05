class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    about_tab = AboutController.alloc.init
    restro_tab = UINavigationController.alloc.initWithRootViewController(RestroController.alloc.initWithStyle(UITableViewStylePlain))
    restro_tab.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemSearch, tag: 1)
    @tabbar = UITabBarController.alloc.init
    @tabbar.viewControllers = [ restro_tab, about_tab ]
    @tabbar.wantsFullScreenLayout = true
    @window.rootViewController = @tabbar
    true
  end
end
