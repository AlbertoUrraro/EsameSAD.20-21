//
//  TerapiaViewController.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class TerapiaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var medicinali = ["Tachipirina", "Cardiospirina", "Brufen"]
    
    @IBOutlet weak var terapiaTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicinali.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = terapiaTableView.dequeueReusableCell(withIdentifier: "terapiacell", for: indexPath) as! TerapiaTableViewCell
        cell.initcell()
        cell.nomeMedicinale.text = medicinali[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
