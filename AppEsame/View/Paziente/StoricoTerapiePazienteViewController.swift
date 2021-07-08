//
//  TerapiaStoricoPazienteViewController.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit

class StoricoTerapiePazienteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var storicoTerapieTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terapie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storicoTerapieTableView.dequeueReusableCell(withIdentifier: "storicocell", for: indexPath) as! StoricoTerapiePazienteTableViewCell
        cell.nome.text = terapie[indexPath.row]
        return cell
    }
    

    var terapie = ["Terapia1", "Terapia2"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                performSegue(withIdentifier: "terapiacontroller", sender: self)
}
}
