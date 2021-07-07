//
//  CartellaClinicaMedicoViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class CartellaClinicaMedicoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tipo = ["Allergie", "Operazioni Subite", "Esenzioni"]
    
    @IBOutlet weak var cartellaClinicaTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartellaClinicaTableView.dequeueReusableCell(withIdentifier: "cartellacell", for: indexPath) as! CartellaClinicaMedicoTableViewCell
        cell.initcell()
        cell.tipo.text = tipo[indexPath.row]
        return cell
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
