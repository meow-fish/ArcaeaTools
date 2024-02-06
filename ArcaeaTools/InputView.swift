//
//  InputView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 25/1/2024.
//

import SwiftUI
import Foundation
import Darwin


struct ContentView: View {
    let functions: [Function] = [.init(name: NSLocalizedString("Get Play Rating", comment: ""), page:1),
                                 .init(name: NSLocalizedString("Calculate World Mode Steps", comment: ""),page:2),
                                 .init(name: NSLocalizedString("Calculate Beyond Chapter Progression", comment: ""), page: 3),
                                 .init(name: NSLocalizedString("Calculate Target Score by using Target Play Rating", comment: ""), page: 4)]
    @State private var path = NavigationPath()
    
    @ViewBuilder func switchFunctions(_ function:Function) -> some View{
        switch function.page{
        case 1:
            GetPlayRatingView()
        case 2:
            GetStepView()
        case 3:
            GetProgressionView()
        case 4:
            GetTargetScoreView()
        default:
            EmptyView()
        }
    }
    
    
    @ViewBuilder var body: some View {
        NavigationStack(path: $path){
            List {
                Section("Functions"){
                    ForEach(functions, id: \.name) { function in
                        NavigationLink(value: function){
                            Text(function.name)
                        }
                    }
                }
            }
            .navigationTitle("Tools")
            .navigationDestination(for: Function.self){ function in
                switchFunctions(function)
                }
            }
        }
    }

struct GetPlayRatingView:View{
    @State private var score = ""
    @State private var constant = ""
    @ViewBuilder var body: some View{
        VStack (spacing:5){
            Section(header: Text("Score")){
                TextField("Enter your score", text: $score)
                    .padding(.all, 20)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
                    .padding(.all, 20)
            }
            Text (String((PlayRating(Score:Double(score) ?? 0.0, Constant:Double(constant) ?? 0.0))))
        }
    }
}

struct GetTargetScoreView:View{
    @State private var targetplayrating = ""
    @State private var constant = ""
    @ViewBuilder var body: some View{
        VStack (spacing:5){
            Section(header: Text("Target Play Rating")){
                TextField("Enter your target play rating", text: $targetplayrating)
                    .padding(.all, 20)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
                    .padding(.all, 20)
            }
            Text (String(FindTargetScore(Constant: Double(constant) ?? 0.0, TargetPlayRating: Double(targetplayrating) ?? 0.0 )))
        }
    }
}

struct GetStepView: View {
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerstep = ""
    @State private var staminaBoost = "1"
    @State private var fragmentBoost = "1"
    @State private var memoryBoost = "1"
    @ViewBuilder var body: some View {
        VStack (spacing:5){
            Section(header: Text("Score")){
                TextField("Enter your score", text: $score)
                    .padding(.all, 20)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
                    .padding(.all, 20)
            }
            Section(header: Text("Partner Step Stats")){
                TextField("Enter your partner step stats", text: $partnerstep)
                    .padding(.all, 20)
            }
            Section(header: Text("Stamina Boost")){
                TextField("Enter Stamina Boost (default value is 1)", text: $staminaBoost)
                    .padding(.all, 20)
            }
            Section(header: Text("Fragment Boost")){
                TextField("Enter Fragment Boost (default value is 1)", text: $fragmentBoost)
                    .padding(.all, 20)
            }
            Section(header: Text("Memory Boost")){
                TextField("Enter Memory Boost (default value is 1)", text: $memoryBoost)
                    .padding(.all, 20)
            }
            Text (String(stepWorld(Score: Double(score) ?? 0.0, Constant: Double(constant) ?? 0.0, PartnerStep:Double(partnerstep) ?? 0.0 , staminaBoost: Double(staminaBoost) ?? 0.0, fragmentBoost: Double(fragmentBoost) ?? 0.0, memoryBoost: Double(memoryBoost) ?? 0.0 )))
        }
    }
    
}

struct GetProgressionView: View {
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerover = ""
    @State private var fragmentBoost = "1"
    @State private var memoryBoost = "1"
    @State private var beyondBoost = "1"
    @ViewBuilder var body: some View {
        VStack (spacing:5){
            Section(header: Text("Score")){
                TextField("Enter your score", text: $score)
                    .padding(.all, 20)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
                    .padding(.all, 20)
            }
            Section(header: Text("Partner Over Stats")){
                TextField("Enter your partner over stats", text: $partnerover)
                    .padding(.all, 20)
            }
            Section(header: Text("Beyond Boost")){
                TextField("Enter Beyond Boost (default value is 1)", text: $beyondBoost)
                    .padding(.all, 20)
            }
            Section(header: Text("Fragment Boost")){
                TextField("Enter Fragment Boost (default value is 1)", text: $fragmentBoost)
                    .padding(.all, 20)
            }
            Section(header: Text("Memory Boost")){
                TextField("Enter Memory Boost (default value is 1)", text: $memoryBoost)
                    .padding(.all, 20)
            }
            Text (String(stepBeyond(Score: Double(score) ?? 0.0, Constant: Double(constant) ?? 0.0, PartnerOver:Double(partnerover) ?? 0.0 , fragmentBoost: Double(fragmentBoost) ?? 0.0, memoryBoost: Double(memoryBoost) ?? 0.0, beyondBoost: Double(beyondBoost) ?? 0.0 )))
        }
    }
    
}
    
struct Function: Hashable {
    let name: String
    let page: Int
}

