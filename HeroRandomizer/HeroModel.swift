//
//  HeroModel.swift
//  HeroRandomizer
//
//  Created by Аргын Молдабек on 07.03.2025.
//

import Foundation

struct Hero: Decodable {
    let id: Int
    let name: String
    let powerstats: PowerStats
    let biography: Biography
    let appearance: Appearance
    let images: Images
}

struct PowerStats: Decodable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Decodable {
    let fullName: String
}

struct Appearance: Decodable {
    let gender: String
    let race: String?
    let height: [String]
    let weight: [String]
}

struct Images: Decodable {
    let lg: String
}
