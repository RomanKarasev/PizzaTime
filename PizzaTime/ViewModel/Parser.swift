//
//  Parser.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//

import Foundation


//   https://ig-food-menus.herokuapp.com/pizzas

//MARK: - Parser
struct Parser {
    
    // MARK: Pizza
    
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
            } catch { }
        }.resume()
    }
    
    // MARK: Burger
    
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
            } catch { }
        }.resume()
    }
    
    // MARK: Desert
    
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
            } catch { }
        }.resume()
    }
    
    // MARK: Drink
    
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
            } catch { }
        }.resume()
    }
    
    // MARK: Chiken
    
    func getChiken(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/fried-chicken")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch { }
        }.resume()
    }
    
    // MARK: Steak
    
    func getSteaks(complition: @escaping (Empty) -> ()) {
        let api = URL(string: "https://ig-food-menus.herokuapp.com/steaks")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data!)
                complition(result)
            } catch { }
        }.resume()
    }
}
