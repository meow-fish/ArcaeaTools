//
//  CalculationMenuView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import SwiftUI
import ImageIO
import CoreImage
import Combine

struct CalculationMenuView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        List(selection: $navigationManager.selectionStateCalculation) {
            
            Text("Play Rating")
                .tag(DetailSelectionCalculation.one)
            Text("Beyond Chapter")
                .tag(DetailSelectionCalculation.two)
            Text("World Chapter")
                .tag(DetailSelectionCalculation.three)
            
        }

    }
}


