//
//  TabBarViewController.swift
//  Instagram
//
//  Created by Kajol   on 05/07/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabs()
        self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .black
        self.configureNavigationBar()
    }

    private func setUpTabs() {
        
        let home = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let homeItem = UITabBarItem(title: "", image: UIImage.init(systemName: "house"), tag: 1)
        home.tabBarItem = homeItem
        
        let explore = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
        let exploreItem = UITabBarItem(title: "", image: UIImage.init(systemName: "magnifyingglass"), tag: 2)
        explore.tabBarItem = exploreItem
        
        let camera = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        let cameraItem = UITabBarItem(title: "", image: UIImage.init(systemName: "plus"), tag: 3)
        camera.tabBarItem = cameraItem
        
        let notification = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        let notificationItem = UITabBarItem(title: "", image: UIImage.init(systemName: "heart"), tag: 4)
        notification.tabBarItem = notificationItem
        
        let profile = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        let profileItem = UITabBarItem(title: "", image: UIImage.init(systemName: "person"), tag: 5)
        profile.tabBarItem = profileItem

        self.viewControllers = [home, explore, camera, notification, profile]
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        
        return nav
    }
    
    private func  configureNavigationBar() {

        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettingsButton))
    }

    @objc private func didTapSettingsButton() {
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
    }
}
