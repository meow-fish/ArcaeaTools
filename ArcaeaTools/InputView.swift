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
        Form{

                TextField("Score", text: $score)
                    .padding(.horizontal, 10)
                TextField("Chart Constant", text: $constant)
                    .padding(.horizontal, 10)
                LabeledContent("Play Rating", value: String((PlayRating(Score:Double(score) ?? 0.0, Constant:Double(constant) ?? 0.0))))
                    .padding(.horizontal, 10)
            
        }
    }
}

struct GetTargetScoreView:View{
    @State private var targetplayrating = ""
    @State private var constant = ""
    @ViewBuilder var body: some View{
        Form{
                TextField("Target Play Rating", text: $targetplayrating)
                    .padding(.horizontal, 10)
                TextField("Chart Constant", text: $constant)
                    .padding(.horizontal, 10)
                LabeledContent("Target Score", value: String(FindTargetScore(Constant: Double(constant) ?? 0.0, TargetPlayRating: Double(targetplayrating) ?? 0.0 )))
                    .padding(.horizontal, 10)
        }
    }
}

struct GetStepView: View {
    enum FragmentBoost: Double, CaseIterable, Identifiable {
        case none = 1.00
        case oneone = 1.10
        case onetwofive = 1.25
        case onefive = 1.50
        var id: Self { self }
    }
    @State private var selectedFragmentBoost: FragmentBoost = .none
    
    enum StaminaBoost: Double, CaseIterable, Identifiable {
        case none = 1.00
        case two = 2.00
        case four = 4.00
        case six = 6.00
        var id: Self { self }
    }
    @State private var selectedStaminaBoost: StaminaBoost = .none
    
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerstep = ""
    @State private var staminaBoost = ""
    @State private var fragmentBoost = ""
    @State private var length = ""
    @State private var memoryBoost = false
    @State private var legacy = false
    @ViewBuilder var body: some View {
        Form{
            VStack{
                TextField("Score", text: $score)
                    .padding(.horizontal, 10)
                TextField("Chart Constant", text: $constant)
                    .padding(.horizontal, 10)
                TextField("Partner Step Stats", text: $partnerstep)
                    .padding(.horizontal, 10)
                TextField("Map Length", text: $length)
                    .padding(.horizontal, 10)
                Picker("Fragment Boost", selection: $selectedFragmentBoost) {
                        Text("None").tag(FragmentBoost.none)
                        Text("x1.1").tag(FragmentBoost.oneone)
                        Text("x1.25").tag(FragmentBoost.onetwofive)
                        Text("x1.5").tag(FragmentBoost.onefive)
                    }
                    .padding(.horizontal, 10)
                Picker("Stamina Boost", selection: $selectedStaminaBoost) {
                        Text("None").tag(StaminaBoost.none)
                        Text("x2").tag(StaminaBoost.two)
                        Text("x4").tag(StaminaBoost.four)
                        Text("x6").tag(StaminaBoost.six)
                    }
                    .padding(.horizontal, 10)

                Toggle("Memory Boost", isOn: $memoryBoost)
                Toggle("Legacy Chapter", isOn: $legacy)
                
                LabeledContent("Step", value: String(stepWorld(Score: Double(score) ?? 0, Constant: Double(constant) ?? 0, PartnerStep: Double(partnerstep) ?? 0, staminaBoost: selectedStaminaBoost.rawValue, fragmentBoost: selectedFragmentBoost.rawValue, memoryBoost: memoryBoost)))
                .padding(.horizontal, 10)
                
                LabeledContent("Amount of Stamina", value: String(stepWorldRoundStamina(Score: Double(score) ?? 0, Constant: Double(constant) ?? 0, PartnerStep: Double(partnerstep) ?? 0, staminaBoost: selectedStaminaBoost.rawValue, Length: Double(length) ?? 0, fragmentBoost: selectedFragmentBoost.rawValue, memoryBoost: memoryBoost, Legacy: legacy, getStamina: true, getRound: false)))
                    .padding(.horizontal, 10)
                
                LabeledContent("Amount of Round", value: String(stepWorldRoundStamina(Score: Double(score) ?? 0, Constant: Double(constant) ?? 0, PartnerStep: Double(partnerstep) ?? 0, staminaBoost: selectedStaminaBoost.rawValue, Length: Double(length) ?? 0, fragmentBoost: selectedFragmentBoost.rawValue, memoryBoost: memoryBoost, Legacy: legacy, getStamina: false, getRound: true)))
                    .padding(.horizontal, 10)
                
            }

        }
    }
}

struct GetProgressionView: View {
    enum FragmentBoost: Double, CaseIterable, Identifiable {
        case none = 1.00
        case oneone = 1.10
        case onetwofive = 1.25
        case onefive = 1.50
        var id: Self { self }
    }
    @State private var selectedFragmentBoost: FragmentBoost = .none
    
    
    enum BeyondBoost: Double, CaseIterable, Identifiable {
        case none = 1.00
        case two = 2.00
        case three = 3.00
        var id: Self { self }
    }
    @State private var selectedBeyondBoost: BeyondBoost = .none
   
    
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerover = ""
    @State private var memoryBoost = false
    @ViewBuilder var body: some View {
        Form{
            VStack{
                TextField("Score", text: $score)
                    .padding(.horizontal, 10)
                TextField("Chart Constant", text: $constant)
                    .padding(.horizontal, 10)
                TextField("Partner Over Stats", text: $partnerover)
                    .padding(.horizontal, 10)
                
                Picker("Fragment Boost", selection: $selectedFragmentBoost) {
                        Text("None").tag(FragmentBoost.none)
                        Text("x1.1").tag(FragmentBoost.oneone)
                        Text("x1.25").tag(FragmentBoost.onetwofive)
                        Text("x1.5").tag(FragmentBoost.onefive)
                    }
                    .padding(.horizontal, 10)
                Picker("Beyond Boost", selection: $selectedBeyondBoost) {
                        Text("None").tag(BeyondBoost.none)
                        Text("x2").tag(BeyondBoost.two)
                        Text("x3").tag(BeyondBoost.three)
                    }
                    .padding(.horizontal, 10)

                Toggle("Memory Boost", isOn: $memoryBoost)
                
                LabeledContent("Play Rating", value: String(stepBeyond(Score: Double(score) ?? 0, Constant: Double(constant) ?? 0, PartnerOver: Double(constant) ?? 0, fragmentBoost: selectedFragmentBoost.rawValue, memoryBoost: memoryBoost, beyondBoost: selectedBeyondBoost.rawValue)))
                .padding(.horizontal, 10)
                
            }

        }

                    }
                }
    
struct Function: Hashable {
    let name: String
    let page: Int
}
