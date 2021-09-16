//
//  ContentView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-08.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .yellow]
    @EnvironmentObject var vmEnv: hydrationViewModel
    var body: some View {
        VStack {
            Image("Coin")
                .resizable()
                .frame(width: 40.0, height: 40.0)
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(hydrationViewModel())
    }
}
