//
//  RichiesteViewController.swift
//  AppEsame
//
//  Created by Anna on 04/06/2021.
//

import UIKit

class RichiesteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = richiestaTableView.dequeueReusableCell(withIdentifier: "richiestecell", for: indexPath) as! RichiesteTableViewCell
        cell.initcell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    

    @IBOutlet weak var richiestaTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
