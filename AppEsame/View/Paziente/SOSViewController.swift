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
        addLeftBarIcon()
    }
    
    //Funzione per settare il logo a sinistra
    func addLeftBarIcon() {
        let logoImage = UIImage.init(named: "logo2.png")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:60,height:25.0)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 60)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 25)
         heightConstraint.isActive = true
         widthConstraint.isActive = true
         navigationItem.leftBarButtonItem =  imageItem
    }
}
