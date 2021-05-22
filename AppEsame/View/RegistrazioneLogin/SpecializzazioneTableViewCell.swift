//
//  SpecializzazioneTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 15/05/2021.
//


import UIKit
import DLRadioButton

class SpecializzazioneTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nomeSpecializzazione: UILabel!
    @IBOutlet weak var seleziona: DLRadioButton!
    
    func initCell(nomeSpecializzazione: String){
        self.nomeSpecializzazione.text = nomeSpecializzazione
        seleziona.isMultipleSelectionEnabled = true
    }
}

