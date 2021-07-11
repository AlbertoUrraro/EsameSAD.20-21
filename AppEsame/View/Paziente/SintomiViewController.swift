//
//  SintomiViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit
import DLRadioButton


class SintomiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sintomiTableView: UITableView!

    
    var sintomiVet: [String] = []
    var sintomiSelezionati: [String] = []
    var tag : [Int] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sintomiVet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sintomiTableView.dequeueReusableCell(withIdentifier: "sintomocell", for: indexPath) as! SintomiTableViewCell
        cell.initcell()
        cell.nomeSintomo.text = sintomiVet[indexPath.row]
        cell.seleziona.tag = indexPath.row
        cell.seleziona.addTarget(self, action: #selector(checkPressed(sender:)), for: .touchUpInside)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let avantiButton = UIBarButtonItem(title: "Avanti", style: .bordered, target: self, action: #selector(avanti(sender:)))
           self.navigationItem.rightBarButtonItem  = avantiButton
    
        let s = SintomiViewModel()
        
        s.ottieniTuttiSintomi{(sintomi) in
            
            guard let sintomiRes = sintomi else {
                print("error")
                return
            }
            for sintomo in sintomiRes{
                self.sintomiVet.append(sintomo.getDescrizione())
            }
            self.sintomiTableView.reloadData()
            
        }
    
    }
    
    @objc func avanti(sender: Any){
        performSegue(withIdentifier: "ParametriController", sender: self)
        
        let progress = ProgressBar()
        progress.setProgress(progress: 50)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "SELEZIONA I TUOI SINTOMI:"
    }
    
    
    @objc func checkPressed(sender: DLRadioButton)
    {
       var i = 0
       var presente = false
       print("Button tag \(sender.tag)")
        print(sintomiVet[sender.tag])
        if (tag.isEmpty)
        {
        sintomiSelezionati.append(sintomiVet[sender.tag])
        print(sintomiSelezionati)
        tag.append(sender.tag)
        }
        else{
        for _ in tag{
            if (tag[i] == sender.tag){
                sintomiSelezionati.remove(at: i)
                print("trovato")
                presente = true
                tag.remove(at: i)
                print(sintomiSelezionati)
            } else {
                i=i+1
            }
         }
        print (tag)
        if (presente == false){
        sintomiSelezionati.append(sintomiVet[sender.tag])
        print(sintomiSelezionati)
        tag.append(sender.tag)
        }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Con queste istruzioni controllo in quale view sto andando per passare i dati con il prepare for segue
        if segue.identifier == "ParametriController"
        {
            if let destinazione = segue.destination as? ParametriViewController {
               

                destinazione.sintomiSelezionati = self.sintomiSelezionati
            }
        }
    }
   
   
}
