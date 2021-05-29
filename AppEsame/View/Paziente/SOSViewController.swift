//
//  SOSViewController.swift
//  AppEsame
//
//  Created by Anna on 29/05/2021.
//

import UIKit

class SOSViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var nome = ["Anna", "Carlo"]
    var cognome = ["Cervo", "D'Avino"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sosTableView.dequeueReusableCell(withIdentifier: "soscell", for: indexPath) as! SOSTableViewCell
        cell.nome.text = nome[indexPath.row]
        cell.cognome.text = cognome [indexPath.row]
        return cell
    }
    

    @IBOutlet weak var sosTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
