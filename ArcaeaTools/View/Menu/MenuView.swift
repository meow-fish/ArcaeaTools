//
//  MenuView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/3/2024.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var navigationManager: NavigationStateManager
    
    var body: some View {
        List(selection: $navigationManager.selectedCategory) {
                    
                    ForEach(Categories.allCases) { category in
                        NavigationLink(category.title(), value: category)
                        
            }
        }
    }
}
