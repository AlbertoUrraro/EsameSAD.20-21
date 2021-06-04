//
//  DettaglioPazienteViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class DettaglioPazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tipo = ["Prescrivi terapia", "Stato salute", "Cartella clinica", "Storico terapie"]
    @IBOutlet weak var dettaglioTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dettaglioTableView.dequeueReusableCell(withIdentifier: "dettagliocell", for : indexPath) as! DettaglioPazienteTableViewCell
        cell.initcell()
        cell.tipo.text = tipo[indexPath.row]
        if (indexPath.row == 0){
            cell.button.setTitle("Prescrivi", for: .normal)
        } else{
            cell.button.setTitle("Vedi", for: .normal)
        }
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(visualizzaAction(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @objc func visualizzaAction(sender: UIButton){
     if (sender.tag == 0){
             performSegue(withIdentifier: "PrescriviController", sender: self)
     } else if(sender.tag == 1){
             performSegue(withIdentifier: "StatoController", sender: self)
         } else if(sender.tag == 2){
             performSegue(withIdentifier: "CartellaController", sender: self)
         }
         else {
             performSegue(withIdentifier: "StoricoController", sender: self)
         }
     }

}
