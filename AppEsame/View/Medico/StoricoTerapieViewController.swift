//
//  StoricoTerapieViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class StoricoTerapieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terapie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storicoTableView.dequeueReusableCell(withIdentifier: "storicocell", for: indexPath) as! StoricoTerapieTableViewCell
        cell.initcell()
        cell.nomeTerapia.text = terapie[indexPath.row]
        return cell
    }
    

    var terapie = ["Terapia1", "Terapia2"]
    @IBOutlet weak var storicoTableView: UITableView!
    
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
