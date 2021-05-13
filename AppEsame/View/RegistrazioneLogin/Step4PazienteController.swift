//
//  Step4PazienteController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 12/05/21.
//

import Foundation
import UIKit
import DLRadioButton

class Step4PazienteController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var dottoriTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dottoriTableView.dequeueReusableCell(withIdentifier: "dottorecell", for: indexPath) as! DottoreTableViewCell
        cell.layoutIfNeeded()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dottoriTableView.estimatedRowHeight = 250
        dottoriTableView.rowHeight = UITableView.automaticDimension
        
    }
    
  
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
