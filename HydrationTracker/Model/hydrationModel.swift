//
//  hydrationModel.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import Foundation

struct hydration: Identifiable, Decodable, Encodable {
    var id = UUID()
    var type: String
    var consumption: Double
    var date: Date
    
    init(type: String, consumption: Double, date: Date) {
        self.type = type
        self.consumption = consumption
        self.date = date
    }
}
