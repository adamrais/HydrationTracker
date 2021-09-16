//
//  segmentedControl.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-10.
//

import SwiftUI

struct segmentedControl: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    
    var body: some View {
        VStack {
            Picker("", selection: $vmEnv.selectedDrink) {
                Text("Water")
                    .tag(typeOfDrinks.Water)
                Text("Coffee")
                    .tag(typeOfDrinks.Coffee)
                Text("Juice")
                    .tag(typeOfDrinks.Juice)
                Text("Other")
                    .tag(typeOfDrinks.Other)
            }.pickerStyle(SegmentedPickerStyle())
        }
        
    }
}

struct segmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        segmentedControl()
            .environmentObject(hydrationViewModel())
    }
}
