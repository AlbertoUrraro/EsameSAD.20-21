//
//  ViewController.swift
//  AppEsame
//
//  Created by alberto urraro on 13/04/21.
//

import UIKit
//import FirebaseDatabase
import LocalAuthentication


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //    private let database = Database.database().reference()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var accedi: UIButton!
    
    
    //per FaceId
    var context = LAContext()
    
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
        
        LoginViewModel.appLogin(view: self, email: email, password: password)
    }
    
    @IBAction func loginFaceID(_ sender: Any) {
        
        context = LAContext()
        
        context.localizedCancelTitle = "Enter Username/Password"
        
        // First check if we have the needed hardware support.
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            
            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                
                if success {
                    
                    // Move to the main thread because a state update triggers UI changes.
                    DispatchQueue.main.async { [unowned self] in
                        self.performSegue(withIdentifier: "LoginPaziente", sender: self)
                    }
                } else {
                    print(error?.localizedDescription ?? "Autenticazione fallita")
                    
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            
            // Fall back to a asking for username and password.
            // ...
        }
    }
    
    
}


