//
//  StoryboardTest.swift
//  AppEsameTests
//
//  Created by Anna on 02/09/2021.
//

import XCTest
@testable import AppEsame

class StoryboardTest: XCTestCase {

    override func setUpWithError() throws {
      
    }

    override func tearDownWithError() throws {
        
    }

//Test che il root controller della storyboard main sia quello giusto
    func testInitialControlleriIsLoginVC(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let navigationController =
            storyboard.instantiateInitialViewController()
                as! UINavigationController
        
        let rootViewController = navigationController.viewControllers[0]
        
        XCTAssertTrue(rootViewController is LoginViewController)
    }
    

}
