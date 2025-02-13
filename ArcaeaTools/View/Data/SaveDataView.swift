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
        case full_recall =  "Full Recall"
        case pure_memory = "Pure Memory"
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
            TextField("Chart Constant", text: $constant)
                .padding(.horizontal, 10)
            TextField("Play Rating", text: $playrating)
                .padding(.horizontal, 10)
            TextField("Chart Title", text: $title)
                .padding(.horizontal, 10)

            Picker("Chart level", selection: $selectedLevel){
                ForEach(Level.allCases, id: \.self) { level in
                    Text(level.rawValue).tag(level)
                }
            }
            .padding(.horizontal, 10)

            Picker("Grade", selection: $selectedGrade){
                ForEach(Grade.allCases, id: \.self) { grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            .padding(.horizontal, 10)

            Picker("Clear", selection: $selectedClear){
                ForEach(Clear.allCases, id: \.self) { clear in
                    Text(clear.rawValue).tag(clear)
                }
            }
            .padding(.horizontal, 10)
            Button("Save") {
                let newItem = ChartDataItem(title: title, level: selectedLevel.rawValue, constant: constant, playrating: playrating, score: score, grade: selectedGrade.rawValue, clear: selectedClear.rawValue)
                var existingData = loadDataFromDatabase()
                if let existingIndex = existingData.firstIndex(where: { $0.title == newItem.title }) {
                    if Int(newItem.score) ?? 0 >= Int(existingData[existingIndex].score) ?? 0 {
                        existingData[existingIndex] = newItem
                    }
                } else {
                    existingData.append(newItem)
                }
                chartdata = existingData
                saveDataToDatabase(data: chartdata)
            }
            .padding(.horizontal, 10)
        }
    }
}