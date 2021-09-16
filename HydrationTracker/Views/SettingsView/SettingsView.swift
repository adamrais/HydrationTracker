//
//  SettingsView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    @Binding var showModal: Bool
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Settings")
                    .font(.title)
                    .bold()
            }
            Text("Set your goal: ")
            wheelPicker
            saveButton
            healthKitButton
            warningRectangle.padding()
        }
    }
    
// MARK: - Views
    private var warningRectangle: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 350, height: 100, alignment: .center)
                .cornerRadius(15.0)
                .shadow(radius: 10)
            Text("Logging to health deletes all intake listing from this app! Intake is logged and reset automatically at the start of each day")
                .foregroundColor(.red)
                .padding()
        }
    }
    
    private var wheelPicker: some View {
        VStack {
            Picker("", selection: $vmEnv.selectedIntakeRange) {
                ForEach(0..<vmEnv.intakeRange.count) {
                    Text("\(vmEnv.intakeRange[$0])")
                    }
                }
        }.pickerStyle(WheelPickerStyle())
    }
    
    private var saveButton: some View {
        Button(action: {
            vmEnv.dailyGoal = String(vmEnv.intakeRange[vmEnv.selectedIntakeRange])
            showModal.toggle()
        }, label: {
            HStack {
                Text("Save Goal")
                Image(systemName: "square.and.arrow.down")
            }.modifier(buttonModifier())
        }).buttonStyle(GradientButtonStyle())
    }
    
    private var healthKitButton: some View {
        Button(action: {
            print("loggged in healthkit")
        }, label: {
            HStack {
                Text("Log to Health")
                Image(systemName: "heart.circle.fill")
            }.modifier(buttonModifier())
        }).buttonStyle(HealthGradientButtonStyle())
    }
}

// MARK: - Modifiers
struct HealthGradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showModal: .constant(true))
            .environmentObject(hydrationViewModel())
    }
}
