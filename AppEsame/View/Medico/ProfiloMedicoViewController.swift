//
//  ProfiloMedicoViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 04/07/21.
//

import UIKit
import Firebase


class ProfiloMedicoViewController:  UIViewController, UITableViewDelegate, UICollectionViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
   
    @IBOutlet weak var profiloMedico: UITableView!
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
        profiloMedico.delegate = self
        profiloMedico.dataSource = self
        
        immagineProfilo.image = UIImage(named: "user")
        //immagineProfilo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        immagineProfilo.layer.cornerRadius = immagineProfilo.bounds.height/2
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
    
    
    //funzione caricamento immagine profilo
    
    /*func uploadImmagine(_image:UIImage, completion: @escaping ((_ url: String?)->())){
        guard let uid = Auth.auth().currentUser?.uid else{return}
        let memoriaStorege = Storage.storage().reference().child("utente/\(uid)")
        //guard let imageData = image.jpegData(compressionQuality: 0.75) else{
          //  return
        }*/
    
        //memoriaStorege.putData(<#T##uploadData: Data##Data#>)
    
    
    
}
