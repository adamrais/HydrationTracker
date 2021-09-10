//
//  HydrationTrackerApp.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-08.
//

import SwiftUI

@main
struct HydrationTrackerApp: App {
    @StateObject var vmEnv = hydrationViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vmEnv)
        }
    }
}
