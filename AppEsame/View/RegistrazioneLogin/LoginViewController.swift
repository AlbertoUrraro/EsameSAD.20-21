//
//  ViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 13/04/21.
//

import UIKit
//import FirebaseDatabase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //    private let database = Database.database().reference()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var accedi: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.delegate = self
        email.tag = 0
        password.delegate = self
        password.tag = 1
        
        //Curva bottone
        accedi.layer.cornerRadius = 10
        
        //Apro connessione al db
        DBManager.shared.openConnection()
        
        
        
        
    }
    
    
    
    @IBAction func accedi(_ sender: Any) {
        let errore = LoginViewModel.validaLogin(email: self.email.text!, password: self.password.text!)
        
        if(errore.getErrore()){
            //Popup di errore
            let alertLogin = UIAlertController(title: "Errore", message: errore.getDescrizione(), preferredStyle: UIAlertController.Style.alert)
            alertLogin.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (act) in
                //Eventuale azione
            }))
            self.present(alertLogin,animated: true, completion: nil)
        } else {
            print("Accedo all'app")
            //            performSegue(withIdentifier: "LoginPaziente", sender: self)
            self.appLogin(email: self.email.text!, password: self.password.text!)
        }
    }
    
    @IBAction func segueRegistrazione(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueStep1Registrazione", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Fa sparire la barra del navigation ogni volta che viene caricato
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Fa apparire la barra del navigation quando si esce dal controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        //Fa abbassare la view verso il basso se pongo uguale a false, mentre uguale a true è come se nn lo mettessi
        //self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func appLogin(email: String, password: String){
        let u = Utente()
        
        u.ottieniUtenteDaEmail(emailDaCercare: email){(utenti) in
            
            guard let utentiRes = utenti else {
                print("error")
                return
            }
            if(utentiRes.count == 0){
                //Popup di errore
                let alertLogin = UIAlertController(title: "Errore", message: "Email non presente!", preferredStyle: UIAlertController.Style.alert)
                alertLogin.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (act) in
                    //Eventuale azione
                }))
                self.present(alertLogin,animated: true, completion: nil)
            } else {
                if (password == utentiRes[0].getPassword()){
                    if(utentiRes[0].getTipo() == "Paziente"){
                        self.performSegue(withIdentifier: "LoginPaziente", sender: self)
                        
                    } else {
                        print("segue medico tab bar")
                    }
                } else {
                    //Popup di errore
                    let alertLogin = UIAlertController(title: "Errore", message: "Password errata!", preferredStyle: UIAlertController.Style.alert)
                    alertLogin.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (act) in
                        //Eventuale azione
                    }))
                    self.present(alertLogin,animated: true, completion: nil)
                }
                
            }
            
            
        }
    }
    
}


