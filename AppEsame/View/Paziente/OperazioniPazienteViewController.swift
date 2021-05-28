//
//  OperazioniViewController.swift
//  AppEsame
//
//  Created by Anna on 26/05/2021.
//

import UIKit

class OperazioniPazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var operazioni = ["operazione1", "operazione2"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operazioni.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = operazioniTableView.dequeueReusableCell(withIdentifier: "operazionicell", for: indexPath)as! OperazioniPazienteTableViewCell
        
        cell.nomeOperazione.text = operazioni[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var operazioniTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
