//
//  Step3Paziente.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step3PazienteViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var patologieTableView: UITableView!
    
    //In questa variabile riceverò i dati dalla view precedente
    var pazienteStep2 = Paziente()
    
    var pazientePerSegue = Paziente()
    
    var patologieVet : [String] = []
    var patologieSelezionate: [String] = []
    var tag : [Int] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patologieVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patologieTableView.dequeueReusableCell(withIdentifier: "patologiacell", for: indexPath) as! PatologieTableViewCell
        
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
        patologieTableView.estimatedRowHeight = 250
        patologieTableView.rowHeight = UITableView.automaticDimension
        
        let sp = Step3PazienteViewModel()
        
        sp.ottieniTuttePatologie{(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            for patologia in patologieRes{
                print(patologia.id,patologia.titolo,patologia.codiceEsenzione)
                self.patologieVet.append(patologia.titolo)
            }
            self.patologieTableView.reloadData()
            
        }
        let avantiButton = UIBarButtonItem(title: "Avanti", style: .bordered, target: self, action: #selector(avanti(sender:)))
           self.navigationItem.rightBarButtonItem  = avantiButton
    }
    
    @objc func avanti(sender:Any){
        performSegue(withIdentifier: "SegueStep4Paziente", sender: self)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.pazientePerSegue = self.pazienteStep2
        
        
        
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
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.pazientePerSegue.setPatologie(patologie: patologieSelezionate)
        //Con queste istruzioni controllo in quale view sto andando per passare i dati con il prepare for segue
        if segue.identifier == "SegueStep4Paziente"
        {
            if let destinazione = segue.destination as? Step4PazienteViewController {
                
                
                destinazione.pazienteStep3 = self.pazientePerSegue
            }
        }
    }
    
    
}
