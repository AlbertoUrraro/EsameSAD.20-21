//
//  LoginNavControllerViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 03/07/21.
//

import UIKit

class LoginNavControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    
}
