//
//  AllergiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 11/05/2021.
//

import UIKit
import DLRadioButton

class AllergieTableViewCell: UITableViewCell{

    @IBOutlet weak var nomeAllergia: UILabel!
  
    @IBOutlet weak var seleziona: DLRadioButton!
    
    func initCell(nomeAllergia: String){
        self.nomeAllergia.text = nomeAllergia
        seleziona.isMultipleSelectionEnabled = true
    }

}
