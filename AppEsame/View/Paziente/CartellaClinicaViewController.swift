//
//  CartellaClinicaViewController.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class CartellaClinicaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titoli = ["Allergie","Patologie", "Operazioni subite"]
    @IBOutlet weak var cartellaClinicaTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titoli.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartellaClinicaTableView.dequeueReusableCell(withIdentifier: "cartellaclinicacell", for: indexPath) as! CartellaClinicaTableViewCell
        cell.titolo.text = titoli[indexPath.row]
        cell.visualizza.tag = indexPath.row
        cell.visualizza.addTarget(self, action: #selector(visualizzaAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
   @objc func visualizzaAction(sender: UIButton){
    if (sender.tag == 0){
            performSegue(withIdentifier: "AllergieController", sender: self)
    } else if(sender.tag == 1){
            performSegue(withIdentifier: "PatologieController", sender: self)
        } else{
            performSegue(withIdentifier: "OperazioniController", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   
}
