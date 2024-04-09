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
        let category = navigationManager.selectedCategory
        let stateCal = navigationManager.selectionStateCalculation
        let stateData = navigationManager.selectionStateData
        switch category{
        case .one:
            switch stateCal {
            case .one:
                PlayRatingDetailView()
                
            case .two:
                BeyondWorldDetailView()
                
            case .three:
                WorldDetailView()
                
            default:
                EmptyView()
                
            }
        case .two:
            switch stateData{
            case .one:
                SaveDataView()
            case .two:
                PresentDataView()
            default:
                EmptyView()
            }
        default:
            EmptyView()
        }
    }
}
