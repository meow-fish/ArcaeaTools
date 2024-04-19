//
//  BeyondWorldDetailView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation
import SwiftUI

struct BeyondWorldDetailView: View {
    enum FragmentBoost: String, CaseIterable, Identifiable {
        case none = "1.00"
        case oneone = "1.10"
        case onetwofive = "1.25"
        case onefive = "1.50"
        var id: Self { self }
    }
    @State private var selectedFragmentBoost: FragmentBoost = .none
    
    
    enum BeyondBoost: String, CaseIterable, Identifiable {
        case none = "1.00"
        case two = "2.00"
        case three = "3.00"
        var id: Self { self }
    }
    @State private var selectedBeyondBoost: BeyondBoost = .none
    @State private var constant = ""
    @State private var score = ""
    @State private var playrating = ""
    @State private var partnerover = ""
    @State private var progress = ""
    @State private var memoryBoost = false
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
                TextField("Partner Over Stats", text: $partnerover)
                    .onChange(of: partnerover){
                        partnerover = Partnerover(playrating: playrating, partnerover: partnerover, fragmentBoost: selectedFragmentBoost.rawValue, beyondBoost: selectedBeyondBoost.rawValue, memoryBoost: memoryBoost, progress: progress)
                        }
                    .padding(.horizontal, 10)
                TextField("Progress", text: $progress)
                    .onChange(of: progress){
                        progress = Progress(playrating: playrating, partnerover: partnerover, fragmentBoost: selectedFragmentBoost.rawValue, beyondBoost: selectedBeyondBoost.rawValue, memoryBoost: memoryBoost, progress: progress)
                        }
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
                    .padding(.horizontal, 10)

                
            
        }
    }
}
