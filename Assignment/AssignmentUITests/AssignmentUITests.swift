//
//  AssignmentUITests.swift
//  AssignmentUITests
//
//  Created by TapashM on 18/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import XCTest

class AssignmentUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testSearchBarCancel() {
        let app = XCUIApplication()
        app.tables["Empty list"].searchFields["Please enter any language."].tap()
        app.buttons["Cancel"].tap()
    }
    
    func testSearchBarTyping() {
        
        let app = XCUIApplication()
        app.tables["Empty list"].searchFields["Please enter any language."].tap()
        app.searchFields["Please enter any language."].typeText("Swift")
        app.buttons["Search"].tap()
        
        sleep(5)
        let table = app.tables.element(boundBy: 0)
        table.swipeUp()
        
        app.buttons["Cancel"].tap()
    }
    
    func testRepositorySearchAndNavigation(){
        
        let app = XCUIApplication()
        
        app.tables["Empty list"].searchFields["Please enter any language."].tap()
        
        let sKey = app/*@START_MENU_TOKEN@*/.keys["S"]/*[[".keyboards.keys[\"S\"]",".keys[\"S\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        
        let wKey = app/*@START_MENU_TOKEN@*/.keys["w"]/*[[".keyboards.keys[\"w\"]",".keys[\"w\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        wKey.tap()
        
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let fKey = app/*@START_MENU_TOKEN@*/.keys["f"]/*[[".keyboards.keys[\"f\"]",".keys[\"f\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        fKey.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        sleep(5)
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Alamofire/Alamofire"].tap()
        
        sleep(2)
        let tablesQuery2 = app.tables
        tablesQuery2.staticTexts["3 top contributors"].swipeUp()
        
        sleep(1)
        
        XCUIApplication().navigationBars["RepositoryDetailViewController"].buttons["Search Language"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Error on SignUP"]/*[[".cells.staticTexts[\"Error on SignUP\"]",".staticTexts[\"Error on SignUP\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        sleep(1)
        
        app.statusBars.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 2).swipeDown()
        sleep(1)
        tablesQuery2.staticTexts["3 newest issues"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sleep(1)
        app.navigationBars["RepositoryDetailViewController"].buttons["Search Language"].tap()
        sleep(1)
        tablesQuery2.buttons["Cancel"].tap()
        
    }
    
    
}
