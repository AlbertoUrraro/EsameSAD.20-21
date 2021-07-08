//
//  SOSMedicoViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 06/07/21.
//

import UIKit
import Contacts
import ContactsUI





class SOSMedicoViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, CNContactPickerDelegate {
    
    struct persona {
        let nome: String
        let id : String
        let source : CNContact
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sosTableView.dequeueReusableCell(withIdentifier: "soscell", for: indexPath)
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
       
        
        
    }
    
  
}
