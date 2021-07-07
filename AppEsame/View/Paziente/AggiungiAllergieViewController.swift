//
//  AggiungiAllergoeViewController.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit
import DLRadioButton

class AggiungiAllergieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    **********MANCA L'INVIO AL DB: HO FATTO LA CHIAMATA AL DB PER OTTENERE LE ALLERGIE E LE METTO ANCHE NEL VETTORE ALLERGIE SELEZIONATE MA MANCA L'INVIO AL DB
    var allergieVet : [String] = []
    var allergieSelezionate: [String] = []
    var tag : [Int] = []
    
    @IBOutlet weak var aggiungiAllergieTableView: UITableView!
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergieVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = aggiungiAllergieTableView.dequeueReusableCell(withIdentifier: "allergiacell", for: indexPath) as! AggiungiAllergieTableViewCell
        cell.layoutIfNeeded()
        cell.initCell(nomeAllergia: allergieVet[indexPath.row])
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA LE TUE ALLERGIE"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let al = Allergia()
        
        al.ottieniTutteAllergie{(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            for allergia in allergieRes{
                self.allergieVet.append(allergia.getTitolo())
            }
            self.aggiungiAllergieTableView.reloadData()
            
        }
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
