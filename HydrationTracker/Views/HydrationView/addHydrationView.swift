//
//  addHydrationView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-10.
//

import SwiftUI

struct addHydrationView: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    @Binding var showModal: Bool
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text("New Intake")
                    .font(.largeTitle)
                    .bold()
            }.position(x: 200.0, y: 30.0)
            VStack {
                segmentedControl()
                    .environmentObject(vmEnv)
                Image(systemName: "drop.fill")
                    .font(.system(size: 40))
                    .foregroundColor(vmEnv.drinks)
                    
            }.position(x: 200.0, y: 30.0)
            VStack {
                WheelPickerView()
                    .environmentObject(vmEnv)
                saveButton
            }.position(x: 200.0, y: 30.0)
        }
    }
    
//MARK: - Views
    private var saveButton: some View {
        Button(action: {
            // save intake view
            let hydration = hydration(type: "\(vmEnv.selectedDrink)", consumption: Double(vmEnv.hydrationRange[vmEnv.selectedHydrationRange]), date: Date())
            vmEnv.addDrink(hydration: hydration)
            vmEnv.calculateProgress()
        }, label: {
            HStack {
                Text("Add intake")
                Image(systemName: "square.and.arrow.down")
            }.modifier(buttonModifier())
        }).buttonStyle(GradientButtonStyle())
    }
}

struct addHydrationView_Previews: PreviewProvider {
    static var previews: some View {
        addHydrationView(showModal: .constant(true))
            .environmentObject(hydrationViewModel())
    }
}
