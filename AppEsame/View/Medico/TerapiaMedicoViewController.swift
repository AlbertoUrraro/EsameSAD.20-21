//
//  TerapiaMedicoViewController.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import UIKit

class TerapiaMedicoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var medicinali = ["Tachipirina", "Cardiospirina", "Brufen"]
    var descrizione = ["1 bustina", "1 pillola", "Mezza bustina"]
  
    @IBOutlet weak var terapiaMedicoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicinali.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = terapiaMedicoTableView.dequeueReusableCell(withIdentifier: "terapiacell", for: indexPath) as! TerapiaMedicoTableViewCell
        cell.nomeFarmaco.text = medicinali[indexPath.row]
        cell.descrizione.text = descrizione[indexPath.row]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
   
    
}
