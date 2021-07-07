//
//  Step2MedicoController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton


class Step2PazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep1 = Utente()
    
    var pazientePerSegue = Paziente()
    
    @IBOutlet weak var allergieTableView: UITableView!
    
    var allergieVet : [String] = []
    var allergieSelezionate: [String] = []
    var tag : [Int] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergieVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allergieTableView.dequeueReusableCell(withIdentifier: "allergiacell", for: indexPath) as! AllergieTableViewCell
        cell.layoutIfNeeded()
        cell.initCell(nomeAllergia: allergieVet[indexPath.row])
        cell.seleziona.tag = indexPath.row
        cell.seleziona.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
       
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
        allergieTableView.estimatedRowHeight = 250
        allergieTableView.rowHeight = UITableView.automaticDimension
//        allergieTableView.layer.masksToBounds = true
//        allergieTableViewllergieTableView.layer.cornerRadius = 10
        
        let al = Allergia()
        
        al.ottieniTutteAllergie{(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            for allergia in allergieRes{
                self.allergieVet.append(allergia.getTitolo())
            }
            self.allergieTableView.reloadData()
            
        }
        let avantiButton = UIBarButtonItem(title: "Avanti", style: .bordered, target: self, action: #selector(avanti(sender:)))
           self.navigationItem.rightBarButtonItem  = avantiButton
    }
    
    @objc func avanti(sender:Any){
        performSegue(withIdentifier: "SegueStep3Paziente", sender: self)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.pazientePerSegue.pazienteEqUtente(utente: self.pazienteStep1) // assegno le info della view precedente all'obj paziente da passare alla prossima view
        
        
        
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
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.pazientePerSegue.setAllergia(allergie: self.allergieSelezionate)
        //Con queste istruzioni controllo in quale view sto andando per passare i dati con il prepare for segue
        if segue.identifier == "SegueStep3Paziente"
        {
            if let destinazione = segue.destination as? Step3PazienteViewController {
               

                destinazione.pazienteStep2 = self.pazientePerSegue
            }
        }
    }
    
   
    
}
