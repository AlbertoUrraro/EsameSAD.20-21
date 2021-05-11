//
//  AllergiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 11/05/2021.
//

import UIKit
import DLRadioButton

class AllergiaTableViewCell: UITableViewCell{

    @IBOutlet weak var nomeAllergia: UILabel!
    @IBOutlet weak var checkButton: DLRadioButton!
    

    
    @IBAction func checkAction(_ sender: Any) {
        
    }
    
    func initCell(nomeAllergia: String){
        self.nomeAllergia.text = nomeAllergia
        checkButton.isMultipleSelectionEnabled = true
    }

}
