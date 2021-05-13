//
//  Step2MedicoController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit

class Step2MedicoController: UIViewController{
    
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep1 = Utente(id: "", nome: "", cognome: "", dataNascita: "", codiceFiscale: "", telefono: "", email: "", tipo: "", password: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
