//
//  WorldDetailView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 25/3/2024.
//

import Foundation
import SwiftUI

struct WorldDetailView: View {
    enum FragmentBoost: String, CaseIterable, Identifiable {
        case none = "1.00"
        case oneone = "1.10"
        case onetwofive = "1.25"
        case onefive = "1.50"
        var id: Self { self }
    }
    @State private var selectedFragmentBoost: FragmentBoost = .none
    
    enum StaminaBoost: String, CaseIterable, Identifiable {
        case none = "1.00"
        case two = "2.00"
        case four = "4.00"
        case six = "6.00"
        var id: Self { self }
    }
    @State private var selectedStaminaBoost: StaminaBoost = .none
    @State private var playrating = ""
    @State private var constant = ""
    @State private var score = ""
    @State private var partnerstep = ""
    //@State private var length = ""
    @State private var step = ""
    @State private var memoryBoost = false
    //@State private var legacy = false
    @ViewBuilder var body: some View {
        Form{
                TextField("Score", text: $score)
                    .padding(.horizontal, 10)
                    .onChange(of: score){
                            score = Score(constant: constant, playrating: playrating, score: score)
                        }
                TextField("Chart Constant", text: $constant)
                    .padding(.horizontal, 10)
                    .onChange(of: constant){
                        constant = Constant(score: score, playrating: playrating, constant: constant)
                        }
                TextField("Play Rating", text: $playrating)
                    .padding(.horizontal, 10)
                    .onChange(of: playrating){
                        playrating = Playrating(score: score, constant: constant, playrating: playrating)
                        }
                TextField("Partner Step Stats", text: $partnerstep)
                    .onChange(of: partnerstep){
                        partnerstep = Partnerstep(playrating: playrating, partnerstep: partnerstep, staminaboost: selectedStaminaBoost.rawValue, fragmentboost: selectedFragmentBoost.rawValue, memoryboost: memoryBoost, step: step)
                        }
                    .padding(.horizontal, 10)
                              
                TextField("Steps", text: $step)
                    .onChange(of: step){
                        step = Step(playrating: playrating, partnerstep: partnerstep, staminaboost: selectedStaminaBoost.rawValue, fragmentboost: selectedFragmentBoost.rawValue, memoryboost: memoryBoost, step: step)
                        }
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
                    .padding(.horizontal, 10)

                
                
            
        }
    }
}
