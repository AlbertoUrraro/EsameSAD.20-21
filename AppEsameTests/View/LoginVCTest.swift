//
//  LoginVCTest.swift
//  AppEsameTests
//
//  Created by Anna on 02/09/2021.
//

import XCTest
@testable import AppEsame

class LoginVCTest: XCTestCase {
    var loginController: LoginViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        loginController = (storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController)
        
        loginController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
}
//    Verifico che tutti gli elementi appartengano correttamente al controller, isDescendat(verifica se la subview appartiene alla view)
    func testHasAccediButton(){
        XCTAssert(loginController.accedi.isDescendant(of: loginController.view))
    }
    
    func testHasEmailTF(){
        XCTAssert(loginController.email.isDescendant(of: loginController.view))
    }
    
    func testHasPassword(){
        XCTAssert(loginController.password.isDescendant(of: loginController.view))
    }
    
    func testHasGoogle(){
        XCTAssert(loginController.Googlebutton.isDescendant(of: loginController.view))
    }
    
    func testHasFaceID(){
        XCTAssert(loginController.loginFaceId.isDescendant(of: loginController.view))
    }
    
//    Testo se al bottone accedi è stata assegnata l'azione TouchUpInside
    func testAccediAzioneAssegnata(){
        let accediButton:UIButton = loginController.accedi
      
        guard let actions = accediButton.actions(forTarget: loginController, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
//        tasto destro sul bottone della storyboard e vedo l'azione come si chiama
        XCTAssertTrue(actions.contains("accedi:"))
    }

}
