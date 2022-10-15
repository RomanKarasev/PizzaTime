//
//  Parser.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//

import Foundation

//   https://ig-food-menus.herokuapp.com/pizzas


    
struct Parser {
    
    func getPizzas(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/pizzas")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch {
                
            }
        }.resume()
    }
    
    func getBurgers(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/burgers")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch {
                
            }
        }.resume()
    }
    
    func getDeserts(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/desserts")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch {
                
            }
        }.resume()
    }
    
    func getDrinks(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/drinks")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch {
                
            }
        }.resume()
    }
}
