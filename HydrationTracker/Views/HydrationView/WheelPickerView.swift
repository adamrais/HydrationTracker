//
//  WheelPickerView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-10.
//

import SwiftUI

struct WheelPickerView: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    var body: some View {
        VStack {
            Picker("", selection: $vmEnv.selectedHydrationRange) {
                ForEach(0..<vmEnv.hydrationRange.count) {
                    Text("\(vmEnv.hydrationRange[$0])")
                    }
                }
        }.pickerStyle(WheelPickerStyle())
    }
}

struct WheelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        WheelPickerView()
            .environmentObject(hydrationViewModel())
    }
}
