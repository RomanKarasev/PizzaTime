//
//  Resources.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 13.10.2022.
//

import UIKit

enum Resources {
    
    enum Colors {
        static var active = UIColor(hexString: "#FD3A69")
        static var inactive = UIColor(hexString: "#C3C4C9")
        static var tabBar = UIColor(hexString: "#FFFFFF")
        static var tableView = UIColor(hexString: "#FFFFFF")
        static var shadowColor = UIColor(hexString: "#F4F4F4")
        static var backgroundColor = UIColor(hexString: "#E5E5E5")
        static var descriptionText = UIColor(hexString: "#AAAAAD")
        static var priceButtonColor = UIColor(hexString: "#FD3A69")
        static var separator = UIColor(hexString: "#E8ECEF")
        static var categoryColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 0.4019346932)
        static var categorySelectedBackgroundColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 0.2014847307)
        static var categorySelectedTextColor = UIColor(hexString: "#FD3A69")
    }
//    UIColor(red: 253, green: 58, blue: 105, alpha: 0.4)
//    (red: 253, green: 58, blue: 105, alpha: 0.2)
    
    enum Strings {
        enum TabBar {
            static var menu = "Меню"
            static var contacts = "Контакты"
            static var profile = "Профиль"
            static var cart = "Корзина"
        }
        enum Main {
            static var defaultImageName = "default"
        }
    }
    
    enum Images {
        
        enum Main {
            static var pizza = UIImage(named: "default")
        }
        enum TabBar {
            static var menu = UIImage(named: "menu")
            static var contacts = UIImage(named: "contacts")
            static var profile = UIImage(named: "profile")
            static var cart = UIImage(named: "cart")
        }
        
        enum NavBar {
            static var arrow = UIImage(named: "Arrow")
        }
        
        enum Baner {
            static var baner0 = UIImage(named: "baner0")
            static var baner1 = UIImage(named: "baner1")
        }
    }
}
