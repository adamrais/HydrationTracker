//
//  intakeListView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-10.
//

import SwiftUI

struct intakeListView: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    var hydration: hydration
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 350, height: 50, alignment: .center)
                .shadow(radius: 10)
            HStack {
                Text("\(String(hydration.consumption)) mL").padding(.trailing, 80)
                Text(hydration.type)
                Image(systemName: "drop.fill").foregroundColor(vmEnv.drinks)
                Text(hydration.date, style: .time)
            }.foregroundColor(.black)
        }
    }
}

struct intakeListView_Previews: PreviewProvider {
    static var previews: some View {
        intakeListView(hydration: hydration(type: "Water", consumption: 1500.0, date: Date()))
            .environmentObject(hydrationViewModel())
    }
}
