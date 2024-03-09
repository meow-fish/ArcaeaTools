//
//  MenuView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import SwiftUI
import Combine

struct MenuView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        List(selection: $navigationManager.selectionState) {
            
            Text("Play Rating")
                .tag(SelectionState.one)
            Text("Beyond Chapter")
                .tag(SelectionState.two)
            Text("World Chapter")
                .tag(SelectionState.three)
            
        }

    }
}


