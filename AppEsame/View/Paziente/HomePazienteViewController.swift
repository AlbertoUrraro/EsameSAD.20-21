//
//  HomeViewController.swift
//  AppEsame
//
//  Created by Anna on 17/05/2021.
//

import UIKit


class HomePazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var indexRow = 0


    @IBOutlet weak var homePazienteTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homePazienteTableView.dequeueReusableCell(withIdentifier: "homecell",for: indexPath ) as! HomePazienteTableViewCell
        if (indexPath.row == 0){

        cell.nome.text = "Stato salute"
            let image = UIImage(named: "GreenButton.png")
//            cell.stato.image = image
        }
        else  if (indexPath.row == 1){
//            cell.nome.text = "Terapia"+String(indexPath.row)
            cell.nome.text = "Terapia"
            let image = UIImage(named: "RedButton.png")
//            cell.stato.image = image
        }
        else{
            cell.nome.text = "Storico terapie"
//            cell.stato.isHidden = true
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            performSegue(withIdentifier: "SintomiController", sender: self)
        }
        else if (indexPath.row == 1){
            indexRow = indexPath.row
            performSegue(withIdentifier: "TerapiaController", sender: self)
        }
        else{
            
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
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
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 21))
//            label.textAlignment = .right
//            label.text = DBManager.shared.nome + " " + DBManager.shared.cognome
//
//            let widthConstraintlabel = view.widthAnchor.constraint(equalToConstant: 60)
//            let heightConstraintlabel = view.heightAnchor.constraint(equalToConstant: 25)
//            heightConstraintlabel.isActive = true
//            widthConstraintlabel.isActive = true
            
            
            
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
