//
//  DettaglioPazienteTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class DettaglioPazienteTableViewCell: UITableViewCell {

    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var button: UIButton!
    
    func initcell(){
        button.layer.cornerRadius = 10
    }

}
