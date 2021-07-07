//
//  SintomiViewController.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit

class SintomiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sintomiTableView: UITableView!

    
    var sintomi = ["mal di gola", "mal di testa", "febbre", "tosse"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sintomi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sintomiTableView.dequeueReusableCell(withIdentifier: "sintomocell", for: indexPath) as! SintomiTableViewCell
        cell.initcell()
        cell.nomeSintomo.text = sintomi[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let avantiButton = UIBarButtonItem(title: "Avanti", style: .bordered, target: self, action: #selector(avanti(sender:)))
           self.navigationItem.rightBarButtonItem  = avantiButton
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
