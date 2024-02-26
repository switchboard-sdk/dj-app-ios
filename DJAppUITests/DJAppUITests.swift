//
//  DJAppUITests.swift
//  DJAppUITests
//
//  Created by Balazs Kiss on 26/02/2024.
//

import XCTest

final class DJAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
