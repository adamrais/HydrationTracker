//
//  HydrationViewModel.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import Foundation
import Combine
import SwiftUI

enum typeOfDrinks {
    case Water, Coffee, Juice, Other
}

class hydrationViewModel: ObservableObject {
    var hydrationRange = Array(stride(from: 50, through: 2000, by: 50))
    @Published var selectedHydrationRange = 25
    
    var intakeRange = Array(stride(from: 0, through: 4000, by: 100))
    @Published var selectedIntakeRange = 25
    @Published var dailyGoal: String
    @Published var hydrationData = [hydration]()
    
    @Published var selectedDrink: typeOfDrinks = typeOfDrinks.Water
    @Published var progressML: Double = UserDefaults.standard.double(forKey: "SavedProgress")
    @Published var progress: Float
    var drinks: Color {
        switch selectedDrink {
            case .Water:
                return Color(.systemBlue)
            case .Coffee:
                return Color(.brown)
            case .Juice:
                return Color(.systemOrange)
            case .Other:
                return Color(.systemGray)
        }
    }
    
    init() {
        dailyGoal = "3750"
        progressML = 0.0
        progress = 0
        if let data = UserDefaults.standard.data(forKey: "SavedKey") {
            if let decoded = try? JSONDecoder().decode([hydration].self, from: data) {
                self.hydrationData = decoded
                return
            }
        }
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(hydrationData) {
            UserDefaults.standard.set(encoded, forKey: "SavedKey")
            UserDefaults.standard.set(progressML,forKey: "SavedProgress")
        }
    }
    
    func addDrink(hydration: hydration) {
        hydrationData.append(hydration)
        progressML += hydration.consumption
        self.save()
    }
    
    func deleteDrink(at offsets: IndexSet) {
        hydrationData.remove(atOffsets: offsets)
        self.save()
    }
    
    func calculateProgress() {
        progress += Float(progressML)/Float(dailyGoal)!
    }
    
}
