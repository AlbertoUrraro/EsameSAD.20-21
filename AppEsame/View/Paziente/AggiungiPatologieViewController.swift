//
//  AggiungiPatologieViewController.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit
import DLRadioButton

class AggiungiPatologieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    STESSO DISCORSO DELLE ALLERGIE
    @IBOutlet weak var aggiungiPatologieTableView: UITableView!
  
    var patologieVet : [String] = []
    var patologieSelezionate: [String] = []
    var tag : [Int] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patologieVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = aggiungiPatologieTableView.dequeueReusableCell(withIdentifier: "patologiacell", for: indexPath) as! AggiungiPatologieTableViewCell
        
        cell.initCell(nomePatologia: patologieVet[indexPath.row])
        cell.seleziona.tag = indexPath.row
        cell.seleziona.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
        
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
        let pa = PatologiaViewModel()
        
        pa.ottieniTuttePatologie{(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            for patologia in patologieRes{
                print(patologia.id,patologia.titolo,patologia.codiceEsenzione)
                self.patologieVet.append(patologia.titolo)
            }
            self.aggiungiPatologieTableView.reloadData()
            
        }
    
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
   

    
}

   


