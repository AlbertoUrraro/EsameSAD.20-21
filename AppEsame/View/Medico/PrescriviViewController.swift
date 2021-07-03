//
//  PrescriviViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class PrescriviViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var prescrivi: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = prescriviTableView.dequeueReusableCell(withIdentifier: "prescrivicell", for: indexPath) as! PrescriviTableViewCell
        cell.initcell()
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Farmaco                       Dose                 Ora              Ricetta"
    }
    
    
    @IBOutlet weak var prescriviTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prescrivi.layer.cornerRadius = 10

    }
    @IBAction func azionePrescrivi(_ sender: UIButton) {
        
        
        
    }
    


}
