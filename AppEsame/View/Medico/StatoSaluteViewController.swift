//
//  StatoSaluteViewController.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class StatoSaluteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == sintomiTableView{
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        if tableView == sintomiTableView{
            let cell = sintomiTableView.dequeueReusableCell(withIdentifier: "sintomicell")as! StatoSaluteSintomiTableViewCell
          return cell
        } else {
            let cell = parametriTableView.dequeueReusableCell(withIdentifier: "parametricell") as! StatoSaluteParametriTableViewCell
            return cell
        }
    
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == sintomiTableView{
            return "Sintomi"
        } else {
            return "Parametri"
        }
    }
    

    @IBOutlet weak var sintomiTableView: UITableView!
    @IBOutlet weak var parametriTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
