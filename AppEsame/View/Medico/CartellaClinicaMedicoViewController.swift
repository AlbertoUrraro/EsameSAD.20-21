//
//  CartellaClinicaMedicoViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class CartellaClinicaMedicoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let info = [["Polline", "Polvere"], ["Patologia1","Patologia2"],["Operazione1", "Operazione2"]]
    
    @IBOutlet weak var cartellaClinicaTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartellaClinicaTableView.dequeueReusableCell(withIdentifier: "cartellacell", for: indexPath) as! CartellaClinicaMedicoTableViewCell
        cell.initcell()
        cell.tipo.text = info[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
           return "ALLERGIE"
        } else if(section == 1){
            return "PATOLOGIE"
        }
        else {return "OPERAZIONI SUBITE"
    }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 3
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
