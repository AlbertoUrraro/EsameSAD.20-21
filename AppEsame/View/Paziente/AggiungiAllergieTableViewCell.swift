//
//  AggiungiAllergieTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit
import DLRadioButton

class AggiungiAllergieTableViewCell: UITableViewCell {

    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var checkButton: DLRadioButton!
    
    
    func initCell(nomeAllergia: String){
        self.nome.text = nomeAllergia
        self.checkButton.isMultipleSelectionEnabled = true
    }
    
    

}
