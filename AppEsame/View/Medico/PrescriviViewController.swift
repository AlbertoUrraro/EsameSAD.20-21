//
//  PrescriviViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class PrescriviViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    Mi serve per aggiungere nuove righe
    var array = ["Riga1","Riga2"]
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = prescriviTableView.dequeueReusableCell(withIdentifier: "prescrivicell", for: indexPath) as! PrescriviTableViewCell
        print(indexPath)
        cell.initcell()
        return cell
    }

    
    
    
    @IBAction func aggiungiFarmaco(_ sender: Any) {
        print("Farmaco aggiunto")
        array.append("Riga Aggiunta")
        let myIndexPath = IndexPath(row: array.count-1, section: 0)
        prescriviTableView.beginUpdates()
        prescriviTableView.insertRows(at: [myIndexPath], with: .automatic)
        prescriviTableView.endUpdates()
        
    }
    @IBOutlet weak var prescriviTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
     
    }
    
    @IBAction func inviaTerapia(_ sender: Any) {
        print("Terapia inviata")
    }
    
  
 


}
