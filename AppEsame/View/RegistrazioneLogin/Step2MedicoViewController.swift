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
    var medicoStep1 = Utente(id: "", uid: "", nome: "", cognome: "", dataNascita: "", codiceFiscale: "", telefono: "", email: "", tipo: "", password: "", indirizzo: "", citta: "", cap: "")

    @IBOutlet weak var SpecializzazioneTableView: UITableView!
    var specializzazioniVet: [String] = []
    var specializzazioniSelezionate: [String] = []
    var tag : [Int] = []
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let s = Specializzazione()
        
        s.ottieniTutteSpecializzazioni{(specializzazioni) in
            
            guard let specializzazioniRes = specializzazioni else {
                print("error")
                return
            }
            for specializzazione in specializzazioniRes{
                self.specializzazioniVet.append(specializzazione.getTitolo())
            }
            self.SpecializzazioneTableView.reloadData()
        }
        let avantiButton = UIBarButtonItem(title: "Registrati", style: .bordered, target: self, action: #selector(registrati(sender:)))
           self.navigationItem.rightBarButtonItem  = avantiButton
    }
    
  

    
    @objc func checkPressed(sender: DLRadioButton)
    {
        var i = 0
        var presente = false
        print("Button tag \(sender.tag)")
        print(specializzazioniVet[sender.tag])
        if (tag.isEmpty)
        {
            specializzazioniSelezionate.append(specializzazioniVet[sender.tag])
            print(specializzazioniSelezionate)
            tag.append(sender.tag)
        }
        else{
            for _ in tag{
                if (tag[i] == sender.tag){
                    specializzazioniSelezionate.remove(at: i)
                    print("trovato")
                    presente = true
                    tag.remove(at: i)
                    print(specializzazioniSelezionate)
                } else {
                    i=i+1
                }
            }
            print (tag)
            if (presente == false){
                specializzazioniSelezionate.append(specializzazioniVet[sender.tag])
                print(specializzazioniSelezionate)
                tag.append(sender.tag)
            }
        }
    }

    @objc func registrati(sender:Any){
        RegistrazioneViewModel.completaRegistrazione(medicoStep1: medicoStep1, specializzazioniSelezionate: [])
        performSegue(withIdentifier: "medicocontroller", sender: self)
        }
    
}
