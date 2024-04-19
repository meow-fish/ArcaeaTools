//
//  PresentDataView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 18/4/2024.
//

import SwiftUI
struct PresentDataView: View {
    @EnvironmentObject var navigationManager: NavigationStateManager
    @State private var chartdata: [ChartDataItem] = []
    @State private var selectedItem: ChartDataItem?
    @State private var selectedItemTitle = ""
    
    var body: some View {
        Form {
                    Picker("Select a chart", selection: $selectedItemTitle) {
                        ForEach(chartdata, id: \.title) { item in
                            Text(item.title).tag(item.title)
                        }
                    }                    
                    .padding(.horizontal, 10)
                    
                    if let selectedItem = chartdata.first(where: { $0.title == selectedItemTitle }) {
                        VStack(alignment: .leading){
                            Text("Title: \(selectedItem.title)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Level: \(selectedItem.level)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Constant: \(selectedItem.constant)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Play Rating: \(selectedItem.playrating)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Score: \(selectedItem.score)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Grade: \(selectedItem.grade)")
                                .padding(.horizontal, 10)
                            Divider()
                                .padding(.horizontal, 10)

                            Text("Clear: \(selectedItem.clear)")
                                .padding(.horizontal, 10)
                            
                }
            }
        }
        .onAppear {
            chartdata = loadDataFromDatabase()
        }
    }
}
