//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Denis DRAGAN on 13.07.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        let vcDownloads = UINavigationController(rootViewController: DownloadsViewController())
        
        // Controller image verme. Image isimleri sf symbols uzerinden alindi
        vcHome.tabBarItem.image = UIImage(systemName: "house")
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcDownloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        // TabBar'da bulunan controllerlarin altinda isim gozukmesi
        vcHome.title = "Home"
        vcUpcoming.title = "Coming Soon"
        vcSearch.title = "Top Search"
        vcDownloads.title = "Downloads"
        
        tabBar.tintColor = .label
        
        // TabBar'a kontrollerin eklenmesi
        setViewControllers([vcHome, vcUpcoming, vcSearch, vcDownloads], animated: true)
    }
}

