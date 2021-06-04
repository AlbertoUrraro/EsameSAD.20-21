//
//  CartellaClinicaMedicoTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class CartellaClinicaMedicoTableViewCell: UITableViewCell {

    @IBOutlet weak var tipo: UILabel!
    
    @IBOutlet weak var visualizza: UIButton!
    
    func initcell(){
        visualizza.layer.cornerRadius = 10
    }
}
