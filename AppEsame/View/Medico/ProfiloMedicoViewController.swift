//
//  ProfiloMedicoViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 04/07/21.
//

import UIKit
import Firebase
class ProfiloMedicoViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
   
    @IBOutlet weak var profiloMedico: UITableView!
    var info = [
        [DBManager.shared.nome, DBManager.shared.cognome,DBManager.shared.email],
        [DBManager.shared.citta, "Italiano"],
        ["Informazioni"]
    
    ]
    
    var titoli = ["Utente","Posizione","Applicazione"]
    
   
    override func viewDidLoad() {
            super.viewDidLoad()
            title="Profilo"
        profiloMedico.delegate = self
        profiloMedico.dataSource = self
            
            
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profiloMedico.dequeueReusableCell(withIdentifier: "profilocellMedico",for: indexPath) as! ProfiloMedicoTableViewCell
        cell.infoprofiloMedico?.text = info[indexPath.section][indexPath.row]
        //cell.target(forAction: Selector("cellaAction:"), withSender: self)
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 6 ){
            print("ciao")
         
        }
                      
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return titoli[0]
        } else if(section == 1){
            return titoli[1]
        }
        else {return titoli[2]}
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 3
    }
   
    
    @IBAction func logOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Logout non avvenuto correttamente: %@", signOutError)
        }
     

        
    }
    
}
