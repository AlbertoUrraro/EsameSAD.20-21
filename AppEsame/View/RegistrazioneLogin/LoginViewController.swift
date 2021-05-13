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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.delegate = self
        email.tag = 0
        password.delegate = self
        password.tag = 1
        
        //Apro connessione al db
        DBManager.shared.openConnection()
        
        //        test da togliere
        let paziente = Paziente(nome: "alberto", cognome: "urraro", dataNascita: "01/01/1997", codiceFiscale: "ALBURR000000000", telefono: "3333333333", email: "email@email.it", tipo: "paziente", password: "psw567", allergie: ["polvere","poline"], patologie: ["patologia1","patologia2"])
        
        paziente.creaPaziente()
        
        paziente.ottieniPazienteDaEmail(emailDaCercare: "alberto@email.com"){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            for paziente in pazientiRes{
                print(paziente.nome)
            }
            
        }
        
        paziente.ottieniPazienteDaId(idDaCercare: "uxYo4eUQiDRnZ1bSJxij"){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            
            print(pazientiRes.patologie[0])
            
            
        }
        //        fine test da togliere
        
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
        }
    }
    
    @IBAction func segueRegistrazione(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registrazioneViewController = mainStoryboard.instantiateViewController(withIdentifier: "RegistrazioneViewController") as! RegistrazioneViewController
        //Per la navigation bisogna usare show, con present viene eliminata
        self.show(registrazioneViewController, sender: nil)
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
    
}


