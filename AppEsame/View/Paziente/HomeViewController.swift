//
//  HomeViewController.swift
//  AppEsame
//
//  Created by Anna on 17/05/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homecell",for: indexPath ) as! HomeTableViewCell
        if (indexPath.row == 0){

        cell.titolo.text = "Stato salute"
            let image = UIImage(named: "GreenButton.png")
            cell.stato.image = image
        }
        else {
            cell.titolo.text = "Terapia"+String(indexPath.row)
            let image = UIImage(named: "RedButton.png")
            cell.stato.image = image
       
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    
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
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 21))
            label.textAlignment = .right
            label.text = "Nome Paziente"
            
            
            let widthConstraintlabel = view.widthAnchor.constraint(equalToConstant: 60)
            let heightConstraintlabel = view.heightAnchor.constraint(equalToConstant: 25)
            heightConstraintlabel.isActive = true
            widthConstraintlabel.isActive = true
            
            let labelItem = UIBarButtonItem.init(customView: label)
            let logoImage = UIImage.init(named: "user.png")
            let logoImageView = UIImageView.init(image: logoImage)
            logoImageView.frame = CGRect(x:0.0,y:0.0, width:60,height:25.0)
            logoImageView.contentMode = .scaleAspectFit
            let imageItem = UIBarButtonItem.init(customView: logoImageView)
            let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 60)
            let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 25)
            heightConstraint.isActive = true
            widthConstraint.isActive = true
            
            navigationItem.rightBarButtonItems =  [labelItem,imageItem]
        }

}
