//
//  SaveLocalData.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/3/2024.
//

import Foundation

struct ChartDataItem: Codable {
    var title: String
    var level: String
    var constant: String
    var score: String
    var grade: String
    var clear: String
}

private let dataFileURLKey = "dataFileURL"

func getDataFileURL() -> URL? {
    if let urlString = UserDefaults.standard.string(forKey: dataFileURLKey) {
        return URL(string: urlString)
    }
    return nil
}

func setDataFileURL(_ url: URL) {
    UserDefaults.standard.set(url.absoluteString, forKey: dataFileURLKey)
}

func loadDataFromFile() -> [ChartDataItem] {
    let fileManager = FileManager.default
    var fileURL: URL
    
    if let url = getDataFileURL() {
        fileURL = url
    } else {
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentsURL.appendingPathComponent("chartdata.json")
    }

    if fileManager.fileExists(atPath: fileURL.path) {
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let data = try JSONDecoder().decode([ChartDataItem].self, from: jsonData)
            return data
        } catch {
            print("Error loading data from file: \(error)")
        }
    } else {
        // Create a new file if it doesn't exist
        let newData: [ChartDataItem] = []
        saveDataToFile(data: newData, to: fileURL)
        return newData
    }

    return []
}

func saveDataToFile(data: [ChartDataItem], to fileURL: URL? = nil) {
    let fileManager = FileManager.default
    let url = fileURL ?? fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("chartdata.json")

    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let jsonData = try encoder.encode(data)
        try jsonData.write(to: url)
        print("Data saved to file: \(url.path)")
        setDataFileURL(url)
    } catch {
        print("Error saving data to file: \(error)")
    }
}
