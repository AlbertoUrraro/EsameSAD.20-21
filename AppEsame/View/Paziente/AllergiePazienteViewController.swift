//
//  AllergieViewController.swift
//  AppEsame
//
//  Created by Anna on 26/05/2021.
//

import UIKit

class AllergiePazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var allergie = ["polline", "polvere"]
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
    }
    



}
