//
//  HeroView.swift
//  HeroRandomizer
//
//  Created by Аргын Молдабек on 07.03.2025.
//

import SwiftUI

struct HeroView: View {
    @StateObject private var viewModel = HeroViewModel()
    
    var body: some View {
        VStack {
            if let hero = viewModel.hero {
                VStack {
                    Text(hero.name)
                        .font(.largeTitle)
                        .bold()
                    
                    AsyncImage(url: URL(string: hero.images.lg)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    
                    Text("Full Name: \(hero.biography.fullName)")
                    Text("Intelligence: \(hero.powerstats.intelligence)")
                    Text("Strength: \(hero.powerstats.strength)")
                    Text("Speed: \(hero.powerstats.speed)")
                    Text("Durability: \(hero.powerstats.durability)")
                    Text("Power: \(hero.powerstats.power)")
                    Text("Combat: \(hero.powerstats.combat)")
                    Text("Race: \(hero.appearance.race)")
                    Text("Height: \(hero.appearance.height.joined(separator: ", "))")
                    Text("Weight: \(hero.appearance.weight.joined(separator: ", "))")
                }
                .padding()
            } else {
                Text("Tap the button to get a superhero!")
            }
            
            Button(action: {
                viewModel.fetchRandomHero()
            }) {
                Text("Get Random Hero")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onAppear {
            viewModel.fetchRandomHero()
        }
    }
}
