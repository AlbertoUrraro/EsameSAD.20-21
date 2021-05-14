//
//  Step3Paziente.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step3PazienteController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var patologieTableView: UITableView!
    
    let patologieVet = ["tachicardia", "diabete"]
    var patologieSelezionate: [String] = []
    var tag : [Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patologieTableView.dequeueReusableCell(withIdentifier: "patologiacell", for: indexPath) as! PatologiaTableViewCell
        
        cell.initCell(nomePatologia: patologieVet[indexPath.row])
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA LE TUE PATOLOGIE"
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patologieTableView.estimatedRowHeight = 250
        patologieTableView.rowHeight = UITableView.automaticDimension
    }
    
    @objc func checkPressed(sender: DLRadioButton)
    {
       var i = 0
       var presente = false
       print("Button tag \(sender.tag)")
        print(patologieVet[sender.tag])
        if (tag.isEmpty)
        {
        patologieSelezionate.append(patologieVet[sender.tag])
        print(patologieSelezionate)
        tag.append(sender.tag)
        }
        else{
        for _ in tag{
            if (tag[i] == sender.tag){
                patologieSelezionate.remove(at: i)
                print("trovato")
                presente = true
                tag.remove(at: i)
                print(patologieSelezionate)
            } else {
                i=i+1
            }
         }
        print (tag)
        if (presente == false){
        patologieSelezionate.append(patologieVet[sender.tag])
        print(patologieSelezionate)
        tag.append(sender.tag)
        }
        }
    }
    
    @IBAction func avantiButton(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let step4PazienteController = mainStoryboard.instantiateViewController(withIdentifier: "Step4PazienteController") as! Step4PazienteController
        //Per la navigation bisogna usare show, con present viene eliminata
        self.show(step4PazienteController, sender: nil)
    }
    
    
}
