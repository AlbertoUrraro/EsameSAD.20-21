//
//  AppEsameUITests.swift
//  AppEsameUITests
//
//  Created by Anna on 02/09/2021.
//

//Testo l'invio dello stato di salute del paziente

import XCTest
@testable import AppEsame

class InvioStatoSaluteTest: XCTestCase {

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
    


    func testInviaSS(){
        let app = XCUIApplication()
        
        let emailTF = app.textFields["E-mail"]
        emailTF.tap()
        emailTF.typeText("utente@test.it")
        sleep(1)
        
        let passwordTF = app.secureTextFields["Password"]
        passwordTF.tap()
        passwordTF.typeText("password")
        sleep(1)

        app.buttons["Accedi"].tap()
        
        sleep(2)
        
        app.tables.cells.element(boundBy: 0).tap()
        sleep(2)

        app.tables.cells.buttons.element(boundBy: 1).tap()
        sleep(1)
        app.tables.cells.buttons.element(boundBy: 2).tap()
        sleep(1)
        
        app.buttons["Avanti"].tap()
        sleep(2)
        
        
        app.buttons["Invia"].tap()
        sleep(2)
        
        
        
        
      

    }
}
