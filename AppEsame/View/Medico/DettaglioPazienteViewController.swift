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
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
                performSegue(withIdentifier: "PrescriviController", sender: self)
        } else if(indexPath.row == 1){
                performSegue(withIdentifier: "StatoController", sender: self)
        } else if(indexPath.row == 2){
                performSegue(withIdentifier: "CartellaController", sender: self)
            }
            else {
                performSegue(withIdentifier: "StoricoController", sender: self)
            }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
