//
//  HeroViewModel.swift
//  HeroRandomizer
//
//  Created by Аргын Молдабек on 07.03.2025.
//

import SwiftUI

class HeroViewModel: ObservableObject {
    @Published var hero: Hero?

    private let urlString = "https://akabab.github.io/superhero-api/api/all.json"

    func fetchRandomHero() {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let heroes = try JSONDecoder().decode([Hero].self, from: data)
                    DispatchQueue.main.async {
                        self.hero = heroes.randomElement()
                    }
                } catch {
                    print("Error decoding JSON:", error)
                }
            }
        }.resume()
    }
}
