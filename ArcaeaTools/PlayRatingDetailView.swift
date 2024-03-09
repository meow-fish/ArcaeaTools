//
//  PlayRatingDetailView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 22/3/2024.
//

import Foundation
import SwiftUI
import Combine

struct PlayRatingDetailView: View {
    @EnvironmentObject var navigationManager: NavigationStateManager
    @State private var score = ""
    @State private var constant = ""
    @State private var playrating = ""
        @ViewBuilder var body: some View{
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
                
        }
    }
}


