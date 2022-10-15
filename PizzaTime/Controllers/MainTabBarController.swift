//
//  MainTabBarController.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 13.10.2022.
//

import UIKit

// MARK: - MainTabBarController

class MainTabBarController: UITabBarController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: Methods
    
    private func setupTabBar() {
        let menuViewController = createMenuVC()
        let contactsViewController = createContactsVC()
        let profileViewController =  createProfileVC()
        let cartViewController = createCartVC()
        
        viewControllers = [
            menuViewController,
            contactsViewController,
            profileViewController,
            cartViewController
        ]
        
        tabBar.tintColor = Resources.Colors.active
        tabBar.unselectedItemTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = Resources.Colors.tabBar
        
        tabBar.layer.shadowColor = Resources.Colors.shadowColor.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0,
                                           height: -1)
        tabBar.layer.shadowRadius = 10
    }
}
// MARK: - Private Methods

extension MainTabBarController {
    
    // MARK: createNavController
    
    private func createNavController(vc: UIViewController, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(),
                                tag: 0
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    // MARK: createMenuVC
    
    private func createMenuVC() -> UINavigationController {
        let VC = createNavController(vc: MenuViewController(), itemName: Resources.Strings.TabBar.menu)
        VC.tabBarItem.image = Resources.Images.TabBar.menu
        return VC
    }
    
    // MARK: createContactsVC
    
    private func createContactsVC() -> UINavigationController {
        let VC = createNavController(vc: ContactsViewController(), itemName: Resources.Strings.TabBar.contacts)
        VC.tabBarItem.image = Resources.Images.TabBar.contacts
        return VC
    }
    
    // MARK: createProfileVC
    
    private func createProfileVC() -> UINavigationController {
        let VC = createNavController(vc: ProfileViewController(), itemName: Resources.Strings.TabBar.profile)
        VC.tabBarItem.image = Resources.Images.TabBar.profile
        return VC
    }
    
    // MARK: createCartVC
    
    private func createCartVC() -> UINavigationController {
        let VC = createNavController(vc: CartViewController(), itemName: Resources.Strings.TabBar.cart)
        VC.tabBarItem.image = Resources.Images.TabBar.cart
        return VC
    }
}



