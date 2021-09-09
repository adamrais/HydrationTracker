//
//  CircularProgressBarView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-08.
//

import SwiftUI

struct CircularProgressBarView: View {
    @Binding var progress: Float
    @EnvironmentObject var vmEnv: hydrationViewModel
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            VStack {
                HStack {
                    Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                        .bold()
                    Image(systemName: "drop.fill")
                        .foregroundColor(.blue)
                }.font(.largeTitle)
                Text("of daily goal")
            }
        }
    }
}

struct CircularProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarView(progress: .constant(0.5))
            .environmentObject(hydrationViewModel())
    }
}
