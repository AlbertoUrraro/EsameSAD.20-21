//
//  PatologiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 13/05/2021.
//

import UIKit
import DLRadioButton

class PatologiaTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nomePatologia: UILabel!
    @IBOutlet weak var checkButton: DLRadioButton!
    
    func initCell(nomePatologia: String){
        self.nomePatologia.text = nomePatologia
        checkButton.isMultipleSelectionEnabled = true
    }
    
}
