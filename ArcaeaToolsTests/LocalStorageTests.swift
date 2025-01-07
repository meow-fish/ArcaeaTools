//
//  LocalStorageTests.swift
//  ArcaeaToolsTests
//
//  Created by OpenHands on 25/1/2024.
//

import XCTest
@testable import ArcaeaTools

final class LocalStorageTests: XCTestCase {
    
    var localStorage: SaveLocalDataSQLite!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        localStorage = SaveLocalDataSQLite()
        // Initialize test database
        try localStorage.initializeDatabase()
    }
    
    override func tearDownWithError() throws {
        // Clean up test database
        try localStorage.deleteDatabase()
        try super.tearDownWithError()
    }
    
    func testSaveAndRetrieveData() throws {
        // Given
        let testData = TestData(id: 1, name: "Test", value: 123.45)
        
        // When
        try localStorage.save(data: testData)
        let retrievedData = try localStorage.retrieve(id: 1)
        
        // Then
        XCTAssertEqual(retrievedData?.id, testData.id)
        XCTAssertEqual(retrievedData?.name, testData.name)
        XCTAssertEqual(retrievedData?.value, testData.value)
    }
    
    func testUpdateData() throws {
        // Given
        let initialData = TestData(id: 2, name: "Initial", value: 100.0)
        try localStorage.save(data: initialData)
        
        // When
        let updatedData = TestData(id: 2, name: "Updated", value: 200.0)
        try localStorage.update(data: updatedData)
        let retrievedData = try localStorage.retrieve(id: 2)
        
        // Then
        XCTAssertEqual(retrievedData?.name, "Updated")
        XCTAssertEqual(retrievedData?.value, 200.0)
    }
    
    func testDeleteData() throws {
        // Given
        let testData = TestData(id: 3, name: "ToDelete", value: 300.0)
        try localStorage.save(data: testData)
        
        // When
        try localStorage.delete(id: 3)
        let retrievedData = try localStorage.retrieve(id: 3)
        
        // Then
        XCTAssertNil(retrievedData)
    }
    
    func testPerformanceOfDataOperations() throws {
        measure {
            do {
                let testData = TestData(id: 4, name: "Performance", value: 400.0)
                try localStorage.save(data: testData)
                _ = try localStorage.retrieve(id: 4)
                try localStorage.update(data: testData)
                try localStorage.delete(id: 4)
            } catch {
                XCTFail("Performance test failed with error: \(error)")
            }
        }
    }
}

struct TestData: Codable {
    let id: Int
    let name: String
    let value: Double
}
