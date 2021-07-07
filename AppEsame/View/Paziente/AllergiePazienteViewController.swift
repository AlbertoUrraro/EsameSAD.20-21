//
//  AllergieViewController.swift
//  AppEsame
//
//  Created by Anna on 26/05/2021.
//

import UIKit

class AllergiePazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var allergie: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  allergieTableView.dequeueReusableCell(withIdentifier: "allergiecell", for: indexPath) as! AllergiePazienteTableViewCell
        cell.nomeAllergia.text = allergie[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var allergieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p = Paziente()
        
        p.ottieniPazienteDaId(idDaCercare: DBManager.shared.id){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            
            self.allergie = pazientiRes.getAllergie()
            
            self.allergieTableView.reloadData()
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        allergieTableView.reloadData()
    }
    
}
