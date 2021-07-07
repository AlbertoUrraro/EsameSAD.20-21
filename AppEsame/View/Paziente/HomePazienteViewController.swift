//
//  HomeViewController.swift
//  AppEsame
//
//  Created by Anna on 17/05/2021.
//

import UIKit


class HomePazienteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var indexRow = 0
    var homeVM: HomePazienteViewModel!
    var progress = ProgressBar()

    @IBOutlet weak var homePazienteTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homePazienteTableView.dequeueReusableCell(withIdentifier: "homecell",for: indexPath ) as! HomePazienteTableViewCell
        
        homeVM = HomePazienteViewModel(progress: progress)
        let data  = Date()
        
        let p = progress.getProgress()
        let c = progress.getProgressStartCura()
        
           if (indexPath.row == 0){
            cell.nome.text = "Stato salute"
            cell.progressBar.progressValue = CGFloat(p)
            homeVM.setProgressBarStato(date: data)
           }
        else
           if (indexPath.row == 1){
            cell.nome.text = "Terapia in corso"
            cell.progressBar.progressValue = CGFloat(c)
            homeVM.setProgressBarTerapia(date: data)
           }
        else if (indexPath.row == 2){
            cell.nome.text = "Storico terapie"
            cell.progressBar.isHidden = true

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
            homePazienteTableView.reloadData()
       
          }
    
    override func viewWillAppear(_ animated: Bool) {

        homePazienteTableView.reloadData()
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
