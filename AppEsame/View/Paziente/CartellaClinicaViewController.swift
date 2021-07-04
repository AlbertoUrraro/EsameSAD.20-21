//
//  CartellaClinicaViewController.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class CartellaClinicaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titoli = ["Allergie","Patologie", "Operazioni subite"]
    @IBOutlet weak var cartellaClinicaTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titoli.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartellaClinicaTableView.dequeueReusableCell(withIdentifier: "cartellaclinicacell", for: indexPath) as! CartellaClinicaTableViewCell
        cell.titolo.text = titoli[indexPath.row]
        cell.visualizza.tag = indexPath.row
        cell.visualizza.addTarget(self, action: #selector(visualizzaAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
   @objc func visualizzaAction(sender: UIButton){
    if (sender.tag == 0){
            performSegue(withIdentifier: "AllergieController", sender: self)
    } else if(sender.tag == 1){
            performSegue(withIdentifier: "PatologieController", sender: self)
        } else{
            performSegue(withIdentifier: "OperazioniController", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addLeftBarIcon()
        addRightButton()
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
      
    //Funzione per settare il logo a sinistra
    func addRightButton() {
        
        let profiloButton  = UIButton(type: .custom)
        profiloButton.setImage(UIImage(named: "user.png"), for: .normal)
        profiloButton.frame = CGRect(x:0.0,y:0.0, width:25.0,height:25.0)
        profiloButton.contentMode = .scaleAspectFit
//        let labelItem = UIBarButtonItem.init(customView: label)

        profiloButton.addTarget(self, action: #selector(visualizzaProfilo(sender:)), for: .touchUpInside)
        let widthConstraint = profiloButton.widthAnchor.constraint(equalToConstant: 25)
        let heightConstraint = profiloButton.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint.isActive = true
        widthConstraint.isActive = true

        let profiloItem = UIBarButtonItem.init(customView: profiloButton)
        
        navigationItem.rightBarButtonItem = profiloItem
      
    }

@objc func visualizzaProfilo(sender: UIButton){
    performSegue(withIdentifier: "ProfiloController", sender: self)
}
   
}
