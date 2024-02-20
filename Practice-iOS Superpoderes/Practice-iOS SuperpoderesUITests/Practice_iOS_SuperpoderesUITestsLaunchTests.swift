//
//  Practice_iOS_SuperpoderesUITestsLaunchTests.swift
//  Practice-iOS SuperpoderesUITests
//
//  Created by Cristian Hernán Del Río on 06/02/2024.
//

import XCTest

final class Practice_iOS_SuperpoderesUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
