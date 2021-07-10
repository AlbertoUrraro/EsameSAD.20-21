//
//  SintomiViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

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
   
   
}
