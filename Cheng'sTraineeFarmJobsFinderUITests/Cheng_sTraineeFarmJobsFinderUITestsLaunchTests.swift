//
//  Cheng_sTraineeFarmJobsFinderUITestsLaunchTests.swift
//  Cheng'sTraineeFarmJobsFinderUITests
//
//  Created by 允丞 on 2024/4/13.
//

import XCTest

final class Cheng_sTraineeFarmJobsFinderUITestsLaunchTests: XCTestCase {

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
