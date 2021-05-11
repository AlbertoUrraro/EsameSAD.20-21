//
//  Step2MedicoController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step2PazienteController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    
    @IBOutlet weak var AllergieTableView: UITableView!
    let allergieVet = ["glutine", "polline"]
    var allergieSelezionate: [String] = []
    var tag : [Int] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AllergieTableView.dequeueReusableCell(withIdentifier: "allergiacell", for: indexPath) as! AllergiaTableViewCell
        
        cell.initCell(nomeAllergia: allergieVet[indexPath.row])
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func checkPressed(sender: DLRadioButton)
    {
       var i = 0
       var presente = false
       print("Button tag \(sender.tag)")
        print(allergieVet[sender.tag])
        if (tag.isEmpty)
        {
        allergieSelezionate.append(allergieVet[sender.tag])
        print(allergieSelezionate)
        tag.append(sender.tag)
        }
        else{
        for _ in tag{
            if (tag[i] == sender.tag){
                allergieSelezionate.remove(at: i)
                print("trovato")
                presente = true
                tag.remove(at: i)
                print(allergieSelezionate)
            } else {
                i=i+1
            }
         }
        print (tag)
        if (presente == false){
        allergieSelezionate.append(allergieVet[sender.tag])
        print(allergieSelezionate)
        tag.append(sender.tag)
        }
        }
    }
 
    
    
}
