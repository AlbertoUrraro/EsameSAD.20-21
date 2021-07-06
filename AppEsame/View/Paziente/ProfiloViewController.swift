//
//  ProfiloViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 03/06/21.
//

import UIKit
import Firebase
class ProfiloViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var profiloTableView: UITableView!
   
    var info = [
        [DBManager.shared.nome, DBManager.shared.cognome,DBManager.shared.email],
        [DBManager.shared.citta, "Italiano"],
        ["Informazioni"]
    
    ]
    
    var titoli = ["Utente","Posizione","Applicazione"]
    
   
    override func viewDidLoad() {
            super.viewDidLoad()
            title="Profilo"
        profiloTableView.delegate = self
        profiloTableView.dataSource = self
            
            
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profiloTableView.dequeueReusableCell(withIdentifier: "profilocell" , for: indexPath) as! ProfiloTableViewCell
        cell.InfoProfilo?.text = info[indexPath.section][indexPath.row]
        //cell.target(forAction: Selector("cellaAction:"), withSender: self)
        
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 6 ){
            print("ciao")
         
        }
                      
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let Header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        let testotitolo = UILabel(frame: CGRect(x: 5 , y: 5, width: Header.frame.size.width - 10 , height: Header.frame.size.height))
        Header.addSubview(testotitolo)
        //testotitolo.backgroundColor = .systemGray
        testotitolo.text = titoli[section]
        testotitolo.font = .systemFont(ofSize: 17)
        
     
        return Header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 3
    }
   
    //func cellaAction (sender : UILabel){
       // print("strunz")
        
        
    //}
    
    @IBAction func logOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Logout non avvenuto correttamente: %@", signOutError)
        }
     

        
    }
    
    
}
