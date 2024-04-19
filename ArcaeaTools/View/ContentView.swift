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
    @State private var data: [ChartDataItem] = loadDataFromDatabase()
    @StateObject var navigationStateManager = NavigationStateManager()
    @SceneStorage("navigationState") var navigationStateData: Data?
        var body: some View {
        NavigationSplitView {
            MenuView()
                .navigationSplitViewColumnWidth(200)

        } content: {
            SecondMenuView()
                .navigationSplitViewColumnWidth(150)
            
        } detail: {
            DetailView()
        }
        .environmentObject(NavigationStateManager())
    }
}
