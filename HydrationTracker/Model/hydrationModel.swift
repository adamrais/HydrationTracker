//
//  hydrationModel.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import Foundation

struct hydration: Identifiable {
    var id = UUID()
    var comsumption: Int
    var dateCreated: Date
}
