//
//  PrescriviTerapiaTest.swift
//  AppEsameUITests
//
//  Created by Anna on 03/09/2021.
//

import XCTest

class VisualizzaStoricoTerapieTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    


    func testvisualizzaStoricoTerapie(){
        let app = XCUIApplication()
        
        let emailTF = app.textFields["E-mail"]
        emailTF.tap()
        emailTF.typeText("carlo.davino.4d@gmail.com")
        sleep(1)
        
        let passwordTF = app.secureTextFields["Password"]
        passwordTF.tap()
        passwordTF.typeText("topolino")
        sleep(1)

        app.buttons["Accedi"].tap()
        
        sleep(1)
        
        app.tables.cells.element(boundBy: 2).tap()
        sleep(1)

        app.tables.cells.element(boundBy: 3).tap()
        sleep(1)
        
        app.tables.cells.element(boundBy:0).tap()
        sleep(1)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        sleep(1)
       
        app.navigationBars.buttons.element(boundBy: 0).tap()
        sleep(1)
       
        app.navigationBars.buttons.element(boundBy: 0).tap()
        sleep(1)
        
    }
    
}
