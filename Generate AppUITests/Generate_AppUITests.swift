//
//  Generate_AppUITests.swift
//  Generate AppUITests
//
//  Created by Spencer Pollock on 2018-07-12.
//  Copyright © 2018 spollock. All rights reserved.
//

import XCTest

class Generate_AppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        // Begin tests
        testAboutButton()
        testAboutButtonBack()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAboutButton() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIApplication().buttons["About"].tap()
    }
    func testAboutButtonBack() {
        
        let app = XCUIApplication()
        app.buttons["About"].tap()
        app.buttons["Back"].tap()
        app.
    }
    
}
