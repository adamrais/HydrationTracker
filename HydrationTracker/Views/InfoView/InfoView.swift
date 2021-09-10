//
//  InfoView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-09.
//

import SwiftUI

struct InfoView: View {
    @EnvironmentObject var vmEnv: hydrationViewModel
    @Binding var showModal: Bool
    var body: some View {
        Text("Hello, Info")
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showModal: .constant(true))
            .environmentObject(hydrationViewModel())
    }
}
