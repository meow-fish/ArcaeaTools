//
//  DetailView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var navigationManager: NavigationStateManager
    var body: some View {
            let state = navigationManager.selectionState
            switch state {
                case .one:
                    PlayRatingDetailView()
                
                case .two:
                    BeyondWorldDetailView()
                
                case .three:
                    WorldDetailView()
                
                case nil:
                    EmptyView()
            }
            
        
    }
     
}
