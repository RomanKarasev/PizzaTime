//
//  Model.swift
//  PizzaTime
//
//  Created by Роман Карасёв on 14.10.2022.
//


import Foundation

// MARK: - Element

struct Element: Codable {
    let id: String
    let img: String
    let name, dsc: String
    let price: Double
    let rate: Int
    let country: String
}

typealias Empty = [Element]
