//
//  DataMenuView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 9/4/2024.
//

import SwiftUI

struct DataMenuView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        
        List(selection: $navigationManager.selectionStateData) {
            
            Text("Save Data")
                .tag(DetailSelectionData.one)
            Text("Present Data")
                .tag(DetailSelectionData.two)

        }

    }
}

