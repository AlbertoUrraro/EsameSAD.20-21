//
//  RichiesteTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class RichiesteTableViewCell: UITableViewCell {

    @IBOutlet weak var immagineProfilo: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var cognome: UILabel!
    @IBOutlet weak var accetta: UIButton!
    
    func initcell(){
        accetta.layer.cornerRadius = 10
    }
}
