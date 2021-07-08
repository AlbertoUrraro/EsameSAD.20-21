//
//  SOSViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 06/07/21.
//

import UIKit
import Contacts
import ContactsUI



struct persona {
    let nome: String
    let id : String
    let source : CNContact
    
}

class SOSViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, CNContactPickerDelegate {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sosTableView.dequeueReusableCell(withIdentifier: "contatticell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sosTableView.deselectRow(at: indexPath, animated: true)
        let contact = models[indexPath.row].source
        let vc = CNContactViewController(for: contact)
    
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let cancella = deleteAction(at : indexPath)
         return UISwipeActionsConfiguration(actions: [cancella])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction{
        let action = UIContextualAction(style: .destructive, title: "cancella"){
            (action , view, completion) in
            
            self.models.remove(at: indexPath.row)
            self.sosTableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
        }
        action.image = UIImage(systemName: "trash")
        action.backgroundColor = .red
        
        return action
    }
    
    
    
    //var nome = ["Anna", "Carlo"]
    //var cognome = ["Cervo", "D'Avino"]
    
   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     //   return nome.count
    //}
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let cell = sosTableView.dequeueReusableCell(withIdentifier: "soscell", for: indexPath) as! SOSTableViewCell
        //cell.nome.text = nome[indexPath.row]
       // cell.cognome.text = cognome [indexPath.row]
       // return cell
    //}
    
 
    
    
    var models = [persona]()
    
    @IBAction func aggiungiContatto(_ sender: Any) {
        let vc = CNContactPickerViewController()
        vc.delegate =  self
        self.present(vc, animated: true, completion: nil)
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let nome = contact.givenName + " " + contact.familyName
        let identificatore = contact.identifier
        let model = persona(nome: nome, id: identificatore, source: contact)
        models.append(model)
        sosTableView.reloadData()
        
    }
    
    

    @IBOutlet weak var sosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //addLeftBarIcon()
    }
    
    //Funzione per settare il logo a sinistra
    /*func addLeftBarIcon() {
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
    }*/
}
