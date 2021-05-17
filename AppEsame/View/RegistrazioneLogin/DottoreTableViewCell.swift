//
//  DottoreTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 13/05/2021.
//

import UIKit
import DLRadioButton

class DottoreTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var cognome: UILabel!
    @IBOutlet weak var indirizzo: UILabel!
    @IBOutlet weak var specializzazione: UILabel!
    @IBOutlet weak var aggiungiButton: DLRadioButton!
    
    func initCell(medico: Medico){
        self.nome.text = medico.getNome() 
        self.cognome.text = medico.getCognome() 
        self.indirizzo.text = "indirizzo"
        self.specializzazione.text = medico.specializzazione 
        
        aggiungiButton.isMultipleSelectionEnabled = true
    }
}
