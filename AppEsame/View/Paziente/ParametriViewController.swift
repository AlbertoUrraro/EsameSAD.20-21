//
//  ParametriViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

class ParametriViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    var parametri = ["febbre", "battito cardiaco"]
    
   
   
    @IBOutlet weak var parametriTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parametri.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parametriTableView.dequeueReusableCell(withIdentifier: "parametrocell", for: indexPath)as! ParametriTableViewCell
        cell.nomeParametro.text = parametri[indexPath.row]
        cell.stepperParametro.stepValue = 0.10
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

    }
   
    
    @IBAction func invia(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Paziente", bundle: nil)
                let secondVC = storyboard.instantiateViewController(identifier: "HomeViewController")

                show(secondVC, sender: self)
    }
}
