//
//  SecondMenuView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 9/4/2024.
//

import SwiftUI

struct SecondMenuView: View {
    @EnvironmentObject var navigationManager: NavigationStateManager
    var body: some View {
        let category = navigationManager.selectedCategory
        if category == .one{
            CalculationMenuView()
        }else if category == .two{
            DataMenuView()
        }
    }
}

