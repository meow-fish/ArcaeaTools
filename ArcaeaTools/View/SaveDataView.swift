//
//  SaveDataView.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/3/2024.
//

import SwiftUI

struct SaveDataView: View {
    @State private var title = ""
    @EnvironmentObject var navigationManager: NavigationStateManager
    enum Level: String, CaseIterable, Identifiable {
        case past = "Past"
        case present = "Present"
        case future = "Future"
        case eternal = "Eternal"
        case beyond = "Beyond"
        var id: Self { self }
    }
    @State private var selectedLevel: Level = .future
    
    enum Grade: String, CaseIterable, Identifiable {
        case d = "D"
        case c = "C"
        case b = "B"
        case a = "A"
        case aa = "AA"
        case ex = "EX"
        case exx = "EX+"
        var id: Self { self }
    }
    @State private var selectedGrade: Grade = .ex
    
    enum Clear: String, CaseIterable, Identifiable {
        case easy = "Easy"
        case normal = "Normal"
        case hard = "Hard"
        var id: Self { self }
    }
    @State private var selectedClear: Clear = .normal
    
    @State private var constant = ""
    @State private var score = ""
    @State private var playrating = ""
    @State private var chartdata: [ChartDataItem] = []

    var body: some View {
        Form{
            TextField("Score", text: $score)
                .padding(.horizontal, 10)
                .onChange(of: score){
                    score = Score(constant: constant, playrating: playrating, score: score)
                }
            TextField("Chart Constant", text: $constant)
                .padding(.horizontal, 10)
                .onChange(of: constant){
                    constant = Constant(score: score, playrating: playrating, constant: constant)
                }
            TextField("Play Rating", text: $playrating)
                .padding(.horizontal, 10)
                .onChange(of: playrating){
                    playrating = Playrating(score: score, constant: constant, playrating: playrating)
                }
            TextField("Chart Title", text: $title)
                .padding(.horizontal, 10)

            Picker("Chart level", selection: $selectedLevel){
                Text("Past").tag(Level.past)
                Text("Present").tag(Level.present)
                Text("Future").tag(Level.future)
                Text("Eternal").tag(Level.eternal)
                Text("Beyond").tag(Level.beyond)
            }
            .padding(.horizontal, 10)
            
            Picker("Grade", selection: $selectedGrade){
                Text("D").tag(Grade.d)
                Text("C").tag(Grade.c)
                Text("B").tag(Grade.b)
                Text("A").tag(Grade.a)
                Text("AA").tag(Grade.aa)
                Text("EX").tag(Grade.ex)
                Text("EX+").tag(Grade.exx)
            }
            .padding(.horizontal, 10)
            
            Button("Save") {
                let newItem = ChartDataItem(title: title, level: selectedLevel.rawValue, constant: constant, score: score, grade: selectedGrade.rawValue, clear: selectedClear.rawValue)
                
                if let existingIndex = chartdata.firstIndex(where: { $0.title == newItem.title }) {
                    if Int(newItem.score) ?? 0 > Int(chartdata[existingIndex].score) ?? 0 {
                        chartdata[existingIndex] = newItem
                    }
                } else {
                    chartdata.append(newItem)
                }
                
                saveDataToFile(data: chartdata)
            }

        }
    }
}

