//
//  RichiesteTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

protocol RichiesteDelegate{
    func accettaTapped(at index:IndexPath)
}

class RichiesteTableViewCell: UITableViewCell {

    var delegate:RichiesteDelegate!
    var indexPath:IndexPath!
    
    @IBOutlet weak var immagineProfilo: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var cognome: UILabel!
    @IBOutlet weak var accetta: UIButton!
    @IBOutlet weak var id: UILabel!
    
    @IBAction func accettaAction(_ sender: Any) {
        self.delegate?.accettaTapped(at: indexPath)
    }
    
    
    func initcell(){
        accetta.layer.cornerRadius = 10
    }
    
}
