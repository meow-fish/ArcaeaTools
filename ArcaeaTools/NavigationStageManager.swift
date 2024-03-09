//
//  NavigationStageManager.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation
import Combine
import Darwin

enum SelectionState: Hashable, Codable {
    case one
    case two
    case three
}

class NavigationStateManager: ObservableObject {
    
    @Published var selectionState: SelectionState? = nil
    
    
    var data: Data? {
        get {
           try? JSONEncoder().encode(selectionState)
        }
        set {
            
            guard let data = newValue,
                  let selectionState = try? JSONDecoder().decode(SelectionState.self, from: data) else {
                return
            }
            
            self.selectionState = selectionState
        }
    }
    
    
    func popToRoot() {
       selectionState = nil
    }
    

    func goToTwo() {
        selectionState = .two
    }
    
    func goToOne() {
        selectionState = .one
    }
    
    func goToThree() {
        selectionState = .three
    }
    
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> {
        objectWillChange
            .buffer(size: 1, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
}
