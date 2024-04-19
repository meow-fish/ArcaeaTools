//
//  SaveLocalDataSQLite.swift
//  ArcaeaTools
//
//  Created by Darren Li on 2/5/2024.
//

import Foundation
import SQLite

struct ChartDataItem {
    var title: String
    var level: String
    var constant: String
    var playrating: String
    var score: String
    var grade: String
    var clear: String
}

let fileManager = FileManager.default
let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
let documentsDirectory = paths[0]
let dbPath = documentsDirectory.appending("/chartdata.sqlite3")
let db = try! Connection(dbPath)

let chartDataTable = Table("chartdata")
let title = Expression<String>("title")
let level = Expression<String>("level")
let constant = Expression<String>("constant")
let playrating = Expression<String>("playrating")
let score = Expression<String>("score")
let grade = Expression<String>("grade")
let clear = Expression<String>("clear")

func createDatabase() {
    do {
        try db.scalar(chartDataTable.exists)
    } catch {
        print("Error accessing database, creating a new one: \(error)")
        createChartDataTable()
    }
}

func createChartDataTable() {
    try! db.run(chartDataTable.create { t in
        t.column(title, primaryKey: true)
        t.column(level)
        t.column(constant)
        t.column(playrating)
        t.column(score)
        t.column(grade)
        t.column(clear)
    })
}

func loadDataFromDatabase() -> [ChartDataItem] {
    createDatabase()
    var chartdata: [ChartDataItem] = []
    do {
        for row in try db.prepare(chartDataTable) {
            let item = ChartDataItem(
                title: row[title],
                level: row[level],
                constant: row[constant],
                playrating: row[playrating],
                score: row[score],
                grade: row[grade],
                clear: row[clear]
            )
            chartdata.append(item)
        }
    } catch {
        print("Error loading data from database: \(error)")
    }
    
    return chartdata
}

func saveDataToDatabase(data: [ChartDataItem]) {
    createDatabase()
    do {
        try db.transaction {
            for item in data {
                let insert = chartDataTable.insert(or: .replace,
                    title <- item.title,
                    level <- item.level,
                    constant <- item.constant,
                    playrating <- item.playrating,
                    score <- item.score,
                    grade <- item.grade,
                    clear <- item.clear
                )
                try db.run(insert)
            }
        }
        print("Data saved to database")
    } catch {
        print("Error saving data to database: \(error)")
    }
}
