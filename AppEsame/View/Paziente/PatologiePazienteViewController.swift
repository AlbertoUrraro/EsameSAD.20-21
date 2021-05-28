//
//  PatologieViewController.swift
//  AppEsame
//
//  Created by Anna on 26/05/2021.
//

import UIKit

class PatologiePazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patologie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  patologieTableView.dequeueReusableCell(withIdentifier: "patologiecell", for: indexPath) as! PatologiePazienteTableViewCell
        cell.nomePatologia.text = patologie[indexPath.row]
        return cell
    }
    
var patologie = ["Tachicardia"]
    
    @IBOutlet weak var patologieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
