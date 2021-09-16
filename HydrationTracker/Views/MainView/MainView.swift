//
//  MainView.swift
//  HydrationTracker
//
//  Created by Adam Rais on 2021-09-08.
//

import SwiftUI

struct MainView: View {
    @State var progressValue: Float = 0
    @State var progressValueMl: Int = 0
    @State private var showSettings = false
    @State private var showInfo = false
    @State private var showHydrationView = false
    @EnvironmentObject var vmEnv: hydrationViewModel
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)

            VStack {
                VStack {
                    Text(Date(), style: .date)
                        .font(.largeTitle)
                        .bold()
                    Text("Here is your fluid intake")
                    CircularProgressBarView(progress: $vmEnv.progress)
                        .frame(width: 200.0, height: 200.0)
                        .padding(40.0)
                    Text("\(min(vmEnv.progressML,Double(Int(vmEnv.dailyGoal)!))) mL /" + " \(vmEnv.dailyGoal) mL")
                }.padding(.vertical, 16.0)
                hydrationList
                HStack {
                    infoButton
                    Spacer()
                    intakeButton
                    Spacer()
                    settingsButton
                }.padding().padding(.top, 0.0)
            }
        }.sheet(isPresented: $showSettings) {
            SettingsView(showModal: $showSettings)
                .environmentObject(vmEnv)
        }
        .sheet(isPresented: $showInfo) {
            InfoView(showModal: $showInfo)
                .environmentObject(vmEnv)
        }
        .sheet(isPresented: $showHydrationView) {
            addHydrationView(showModal: $showHydrationView)
                .environmentObject(vmEnv)
        }
    }
    
// MARK: - Views
    init() {
       UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor(.yellow.opacity(0.1))
    }
    private var hydrationList: some View {
        VStack {
            if vmEnv.hydrationData.isEmpty {
                VStack {
                    Text("no data")
                        .font(.largeTitle)
                }.frame(width: 200, height: 120, alignment: .center).padding(.all, 78.0)
            } else {
                List {
                    ForEach(vmEnv.hydrationData) { item in
                        intakeListView(hydration: item)
                    }.onDelete(perform: vmEnv.deleteDrink)
                    .listRowBackground(Color.yellow.opacity(0.1))
                }
            }
        }
    }
    private var intakeButton: some View {
        Button(action: {
            // call hydration view
            showHydrationView = true
        }, label: {
            HStack {
                Text("Add intake")
                Image(systemName: "plus")
            }.modifier(buttonModifier())
        }).buttonStyle(GradientButtonStyle())
    }
    
    private var settingsButton: some View {
        Button(action: {
            showSettings = true
        }, label: {
            Image(systemName: "gear")
                .modifier(buttonModifier())
        })
    }
    
    private var infoButton: some View {
        Button(action: {
            // call info view
            showInfo = true
        }, label: {
            Image(systemName: "info.circle")
                .modifier(buttonModifier())
        })
    }
}

// MARK: - View modifiers
struct buttonModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
                .font(.title)
                .foregroundColor(.black)
        }
}

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(hydrationViewModel())
    }
}
