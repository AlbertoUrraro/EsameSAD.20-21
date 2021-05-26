//
//  Step2MedicoController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step2MedicoViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep1 = Utente(id: "", nome: "", cognome: "", dataNascita: "", codiceFiscale: "", telefono: "", email: "", tipo: "", password: "", indirizzo: "", citta: "", cap: "")

    @IBOutlet weak var SpecializzazioneTableView: UITableView!
    var specializzazioniVet = ["cardiologo", "diabetologo"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specializzazioniVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SpecializzazioneTableView.dequeueReusableCell(withIdentifier: "specializzazionecell", for: indexPath) as! SpecializzazioneTableViewCell
        cell.layoutIfNeeded()
        cell.initCell(nomeSpecializzazione: specializzazioniVet[indexPath.row])
        cell.seleziona.tag = indexPath.row
        cell.seleziona.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA LA TUA SPECIALIZZAZIONE"
    }
    
    @objc func checkPressed(sender: DLRadioButton)
    {
        print(sender.tag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
