//
//  SOSMedicoViewController.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class SOSMedicoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sosTableView.dequeueReusableCell(withIdentifier: "soscell", for: indexPath) as! SOSMedicoTableViewCell
        return cell
    }
    

    @IBOutlet weak var sosTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
