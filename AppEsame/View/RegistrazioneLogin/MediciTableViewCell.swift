//
//  DottoreTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 13/05/2021.
//

import UIKit
import DLRadioButton

class MediciTableViewCell: UITableViewCell {

    

    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var indirizzo: UILabel!
    @IBOutlet weak var specializzazione: UILabel!
    @IBOutlet weak var seleziona: DLRadioButton!
    
    func initCell(medico: Medico){
        self.titolo.text = "Dott." + " " + medico.getNome() + " " + medico.getCognome()
        self.indirizzo.text = medico.getIndirizzo()
        self.specializzazione.text = medico.getSpecializzazioni().joined(separator: ",")
        
        seleziona.isMultipleSelectionEnabled = true
    }
}
