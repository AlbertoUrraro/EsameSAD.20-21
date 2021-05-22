//
//  Step4PazienteController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 12/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step4PazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var mediciTableView: UITableView!
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep3 = Paziente()
    
    var mediciVet : [Medico] = []
    var mediciSelezionati: [String] = []
    var tag : [Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediciVet.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mediciTableView.dequeueReusableCell(withIdentifier: "medicocell", for: indexPath) as! MediciTableViewCell
        cell.initCell(medico: mediciVet[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediciTableView.estimatedRowHeight = 250
        mediciTableView.rowHeight = UITableView.automaticDimension
        
        let me = Medico()
        
        me.ottieniTuttiMedici{(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            for medico in mediciRes{
                
                self.mediciVet.append(medico)
            }
            self.mediciTableView.reloadData()
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    @IBAction func compleaRegistrazionePaziente(_ sender: Any) {
         let p = Paziente()
        p.creaPaziente(paziente: pazienteStep3)
    }
    
}
