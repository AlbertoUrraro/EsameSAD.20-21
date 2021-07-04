//
//  ParametriViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

class ParametriViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    var parametri = ["febbre", "battito cardiaco"]
    var valoreIniziale = [35.0, 60.0]
    var valoreFinale = [41.0, 200.0]
   
   
    @IBOutlet weak var parametriTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parametri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parametriTableView.dequeueReusableCell(withIdentifier: "parametrocell", for: indexPath)as! ParametriTableViewCell
        cell.initcell(valoreIniziale: CGFloat(valoreIniziale[indexPath.row]), valoreFinale: CGFloat(valoreFinale[indexPath.row]))
        cell.nomeParametro.text = parametri[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let inviaButton = UIBarButtonItem(title: "Invia", style: .bordered, target: self, action: #selector(avanti(sender:)))
           self.navigationItem.rightBarButtonItem  = inviaButton
    }
    
    @objc func avanti(sender: Any){
        let storyboard = UIStoryboard(name: "Paziente", bundle: nil)
                let secondVC = storyboard.instantiateViewController(identifier: "HomeViewController")

                show(secondVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA I TUOI PARAMETRI:"
    }
    
}
