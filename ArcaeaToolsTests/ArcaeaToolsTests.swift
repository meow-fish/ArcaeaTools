//
//  ArcaeaToolsTests.swift
//  ArcaeaToolsTests
//
//  Created by Darren Li on 25/1/2024.
//

import XCTest

final class ArcaeaToolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

func testSaveDataView_SaveData() {
        // This is a placeholder test. Replace with a real test that verifies
        // the SaveDataView correctly saves data to the database.  This should
        // include assertions to check that the data is saved correctly and
        // handles edge cases such as duplicate entries.
        XCTAssertTrue(true, "Placeholder test for SaveDataView.  Replace with a real test.")
    }