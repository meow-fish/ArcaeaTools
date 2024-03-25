//
//  NavigationStageManager.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation
import Combine
import Darwin
import SwiftUI

enum Categories: String, Hashable, CaseIterable, Identifiable {
    case one
    case two
    
    var id: String {
        return self.rawValue
    }
    
    func title() -> String {
        switch self {
            case .one:
                return "Calculation"
            case .two:
                return "Data"

        }
    }
}

enum DetailSelectionCalculation:Hashable, Codable {
    case one
    case two
    case three
}

enum DetailSelectionData:Hashable, Codable {
    case one

}

class NavigationStateManager: ObservableObject {
    @Published var selectionStateCalculation: DetailSelectionCalculation? = nil
    @Published var selectionStateData: DetailSelectionData? = nil
    @Published var columnVisibility: NavigationSplitViewVisibility = .automatic
    @Published var selectedCategory: Categories? = nil
  
    func goToOne(){
        selectionStateCalculation = .one
    }
    func goToTwo(){
        selectionStateCalculation = .two
    }
    func goToThree(){
        selectionStateCalculation = .three
    }
    func goToDataOne(){
        selectionStateData = .one
    }

}
