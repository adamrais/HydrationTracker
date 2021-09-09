//
//  HydrationViewModel.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import Foundation
import Combine

class hydrationViewModel: ObservableObject {
    var typeOfDrink = ["water","coffee", "juice", "other"]
    @Published var selectedDrink: String
    @Published var dailyGoal: String
    @Published var hydrationData = [hydration]()
    var intakeRange = Array(stride(from: 0, through: 4000, by: 100))
    @Published var selectedIntakeRange = 25
    
    init() {
        dailyGoal = "3750"
        selectedDrink = ""
    }
}
