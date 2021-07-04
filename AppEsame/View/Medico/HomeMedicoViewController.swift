//
//  HomeMedicoViewController.swift
//  AppEsame
//
//  Created by Anna on 03/06/2021.
//

import UIKit

class HomeMedicoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.filtraContenuti(testoCercato: searchController.searchBar.text!, scope: "Tutti")
    }
    
    
    var resultSearchController: UISearchController?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let controller = self.resultSearchController else {
                   return 0
        }
        if controller.isActive {
                   return self.nomeFiltrato.count
               } else {
                   return self.nome.count
               }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeMedicoTableView.dequeueReusableCell(withIdentifier: "medicocell", for: indexPath) as! HomeMedicoTableViewCell
        
        var nome = String()
        // se viene la Search Bar è attiva allora utilizza l'elemento con indice visualizzato a partire dalla listra Filtrata
                if self.resultSearchController!.isActive {
                    nome = nomeFiltrato[indexPath.row]
                } else {
                    //ricavo un elemento della lista in posizione row (il num di riga) e lo conservo
                    nome = self.nome[indexPath.row]
                }
                
                //riempio la cella assegnando ad una label testuale il nome dell'alimento
                cell.nome?.text = nome
  
                
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              performSegue(withIdentifier: "DettaglioController", sender: self)
    }

    @IBOutlet weak var homeMedicoTableView: UITableView!
    var nome = ["Marco", "Luca"]
    var nomeFiltrato = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.resultSearchController = ({
            // creo un oggetto di tipo UISearchController
            let controller = UISearchController(searchResultsController: nil)
            // rimuove la tableView di sottofondo in modo da poter successivamente visualizzare gli elementi cercati
            controller.dimsBackgroundDuringPresentation = false

            // il searchResultsUpdater, ovvero colui che gestirà gli eventi di ricerca, sarà la ListaTableViewController (o self)
            controller.searchResultsUpdater = self

            // impongo alla searchBar, contenuta all'interno del controller, di adattarsi alle dimensioni dell'applicazioni
            controller.searchBar.sizeToFit()
            
            // atacco alla parte superiore della TableView la searchBar
            self.homeMedicoTableView.tableHeaderView = controller.searchBar
            
            // restituisco il controller creato
            return controller
        })()
        addRightButton()
        addLeftBarIcon()
    }
    

    func filtraContenuti(testoCercato: String, scope: String = "Tutti") {
          print("sto filtrando i contenuti")
        nomeFiltrato.removeAll(keepingCapacity: true)
          for x in nome {
              var justOne = false
            if((x.range(of:testoCercato.localizedUppercase) != nil) && justOne == false) {
                          print("aggiungo \(x) alla listaFiltrata")
                          nomeFiltrato.append(x)
                          justOne = true
             
                      }
                  }
              print(nomeFiltrato)
              self.homeMedicoTableView.reloadData()
          }
      
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
        label.text = DBManager.shared.nome + " " + DBManager.shared.cognome
    
        let widthConstraintlabel = label.widthAnchor.constraint(equalToConstant: 50)
        let heightConstraintlabel = label.heightAnchor.constraint(equalToConstant: 21)
        heightConstraintlabel.isActive = true
        widthConstraintlabel.isActive = true
        
        
        let profiloButton  = UIButton(type: .custom)
        profiloButton.setImage(UIImage(named: "user.png"), for: .normal)
        profiloButton.frame = CGRect(x:0.0,y:0.0, width:25.0,height:25.0)
        profiloButton.contentMode = .scaleAspectFit
       let labelItem = UIBarButtonItem.init(customView: label)

        profiloButton.addTarget(self, action: #selector(visualizzaProfilo(sender:)), for: .touchUpInside)
        let widthConstraint = profiloButton.widthAnchor.constraint(equalToConstant: 25)
        let heightConstraint = profiloButton.heightAnchor.constraint(equalToConstant: 25)
        heightConstraint.isActive = true
        widthConstraint.isActive = true

        let profiloItem = UIBarButtonItem.init(customView: profiloButton)
        
        navigationItem.rightBarButtonItems =  [labelItem,profiloItem]
      
    }
    @objc func visualizzaProfilo(sender: UIButton){
        performSegue(withIdentifier: "ProfiloControllerMedico", sender: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.resultSearchController?.dismiss(animated: false, completion: nil)
    }
    
    
}
