//
//  ContentView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Darwin
import Foundation
import SwiftUI
import SwiftData


struct ContentView: View {
    //@StateObject var dataManager = ModelDataManager()
    @StateObject var navigationStateManager = NavigationStateManager()
    @SceneStorage("navigationState") var navigationStateData: Data?
        var body: some View {
        NavigationSplitView {
            MenuView()
        } detail: {
            DetailView()
        }
        .environmentObject(NavigationStateManager())
    }
}
