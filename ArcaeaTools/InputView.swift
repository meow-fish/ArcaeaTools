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
    let functions: [Function] = [.init(name: "Get Play Rating"),
                                 .init(name: "Calculate World Mode Steps"),
                                 .init(name: "Calculate Target Score by using Target Play Rating")]
    @State private var path = NavigationPath()
    
    @ViewBuilder func switchFunctions(_ function:Function) -> some View{
        switch function.name{
        case "Get Play Rating":
            GetPlayRatingView()
        case "Calculate World Mode Steps":
            GetStepView()
        case "Calculate Target Score by using Target Play Rating":
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
        VStack (spacing:15){
            Section(header: Text("Score")){
                TextField("Enter your score", text: $score)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
            }
            Text (String((PlayRating(Score:Double(score) ?? 0.0, Constant:Double(constant) ?? 0.0))))
        }
    }
}

struct GetTargetScoreView:View{
    @State private var targetplayrating = ""
    @State private var constant = ""
    @ViewBuilder var body: some View{
        VStack (spacing:15){
            Section(header: Text("Target Play Rating")){
                TextField("Enter your target play rating", text: $targetplayrating)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
            }
            Text (String(FindTargetScore(Constant: Double(constant) ?? 0.0, TargetPlayRating: Double(targetplayrating) ?? 0.0 )))
        }
    }
}

struct GetStepView: View {
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerstep = ""
    @State private var magnification = "1"
    @ViewBuilder var body: some View {
        VStack (spacing:15){
            Section(header: Text("Score")){
                TextField("Enter your score", text: $score)
            }
            Section(header: Text("Chart Constant")){
                TextField("Enter the chart constant", text: $constant)
            }
            Section(header: Text("Partner Step Stats")){
                TextField("Enter your partner step stas", text: $partnerstep)
            }
            Section(header: Text("Magnification (default value is 1)")){
                TextField("Enter magnification (default value is 1)", text: $magnification)
            }
            
            Text (String(stepWorld(Score: Double(score) ?? 0.0, Constant: Double(constant) ?? 0.0, PartnerStep:Double(partnerstep) ?? 0.0 , Magnification: Double(magnification) ?? 0.0)))
        }
    }
    
}
    
struct Function: Hashable {
    let name: String
}

