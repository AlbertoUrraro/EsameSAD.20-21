//
//  ProfiloViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 03/06/21.
//

import UIKit
import Firebase
class ProfiloViewController : UIViewController, UITableViewDelegate, UICollectionViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var profiloTableView: UITableView!
   
    var info = [
        [DBManager.shared.nome, DBManager.shared.cognome,DBManager.shared.email],
        [DBManager.shared.citta, "Italiano"],
        ["Informazioni"]
    
    ]
    
    var titoli = ["Utente","Posizione","Applicazione"]
    var imagePicker: UIImagePickerController!
   
    override func viewDidLoad() {
            super.viewDidLoad()
            title="Profilo"
        profiloTableView.delegate = self
        profiloTableView.dataSource = self
        
        immagineProfilo.image = UIImage(named: "user")
        self.immagineProfilo.layoutIfNeeded()
        //immagineProfilo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        immagineProfilo.layer.cornerRadius = immagineProfilo.bounds.size.height/2
    
        immagineProfilo.contentMode = .scaleToFill
        immagineProfilo.layer.borderWidth = 3
        immagineProfilo.layer.borderColor = UIColor.black.cgColor
        let imageClick = UITapGestureRecognizer(target: self, action: #selector(apriImagePicker))
        immagineProfilo.addGestureRecognizer(imageClick)
        immagineProfilo.clipsToBounds = true
        modificaFoto.addTarget(self, action: #selector(apriImagePicker), for: .touchUpInside)
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
            
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
    
    
    @IBOutlet weak var immagineProfilo: UIImageView!
    @IBOutlet weak var modificaFoto: UIButton!
    
     func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @objc  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.editedImage.rawValue) ] as? UIImage{
            self.immagineProfilo.image = pickedImage
            
        }
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func apriImagePicker(_sender:Any){
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
}
