//
//  MedicoTabBarController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class MedicoTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //    Utili per eliminare la tab bar quando collego le due storyboard e non farle sovrapporre
        override func viewWillAppear(_ animated: Bool) {
            self.navigationController?.navigationBar.isHidden = true
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            self.navigationController?.navigationBar.isHidden = true
        }

}
