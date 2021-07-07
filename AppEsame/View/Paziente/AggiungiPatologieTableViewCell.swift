//
//  AggiungiPatologieTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit
import DLRadioButton

class AggiungiPatologieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var seleziona: DLRadioButton!
    
    func initCell(nomePatologia: String){
        self.nome.text = nomePatologia
        seleziona.isMultipleSelectionEnabled = true
    }
}
