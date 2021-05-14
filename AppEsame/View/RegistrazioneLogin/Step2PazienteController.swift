//
//  Step2MedicoController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton
import QuartzCore

class Step2PazienteController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep1 = Utente(id: "", nome: "", cognome: "", dataNascita: "", codiceFiscale: "", telefono: "", email: "", tipo: "", password: "")
    
    @IBOutlet weak var AllergieTableView: UITableView!
    
    let allergieVet = ["glutine", "polline"]
    var allergieSelezionate: [String] = []
    var tag : [Int] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergieVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AllergieTableView.dequeueReusableCell(withIdentifier: "allergiacell", for: indexPath) as! AllergiaTableViewCell
        cell.layoutIfNeeded()
        cell.initCell(nomeAllergia: allergieVet[indexPath.row])
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
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
        return "SELEZIONA LE TUE ALLERGIE"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllergieTableView.estimatedRowHeight = 250
        AllergieTableView.rowHeight = UITableView.automaticDimension
//        AllergieTableView.layer.masksToBounds = true
//        AllergieTableView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(pazienteStep1.getNome())
        
    }
    
    @objc func checkPressed(sender: DLRadioButton)
    {
       var i = 0
       var presente = false
       print("Button tag \(sender.tag)")
        print(allergieVet[sender.tag])
        if (tag.isEmpty)
        {
        allergieSelezionate.append(allergieVet[sender.tag])
        print(allergieSelezionate)
        tag.append(sender.tag)
        }
        else{
        for _ in tag{
            if (tag[i] == sender.tag){
                allergieSelezionate.remove(at: i)
                print("trovato")
                presente = true
                tag.remove(at: i)
                print(allergieSelezionate)
            } else {
                i=i+1
            }
         }
        print (tag)
        if (presente == false){
        allergieSelezionate.append(allergieVet[sender.tag])
        print(allergieSelezionate)
        tag.append(sender.tag)
        }
        }
    }
 
    
    @IBAction func avantiButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let step3PazienteController = mainStoryboard.instantiateViewController(withIdentifier: "Step3PazienteController") as! Step3PazienteController
        //Per la navigation bisogna usare show, con present viene eliminata
        self.show(step3PazienteController, sender: nil)
    }
    
   
    
}
