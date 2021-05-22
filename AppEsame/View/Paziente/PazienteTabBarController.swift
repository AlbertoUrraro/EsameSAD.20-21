//
//  TabBarController.swift
//  AppEsame
//
//  Created by Anna on 17/05/2021.
//

import UIKit

class PazienteTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
//    Utili per eliminare la tab bar quando collego le due storyboard e non farle sovrapporre
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

  
}
