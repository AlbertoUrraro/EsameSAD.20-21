//
//  StatoSaluteViewController.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class StatoSaluteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    Magari quando si preleva dal db fare una sola stringa parametro+valore
    var info = [["febbre", "tosse"],["parametro1", "parametro2"]]
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
            let cell = sintomiTableView.dequeueReusableCell(withIdentifier: "statosalutecell")as! StatoSaluteTableViewCell
        cell.nome.text = info[indexPath.section][indexPath.row]
            return cell
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "SINTOMI"
        } else{
            return "PARAMETRI"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return info[section].count
}
    
 
    

    @IBOutlet weak var sintomiTableView: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
