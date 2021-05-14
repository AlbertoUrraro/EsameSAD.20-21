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
        let paziente = Paziente(id: "", nome: "carlo", cognome: "dav", dataNascita: "01/01/01", codiceFiscale: "00100010010010", telefono: "3333333333", email: "email@email.it", tipo: "paziente", password: "psw567", allergie: ["polvere","poline"], patologie: ["patologia1","patologia2"])
        
        let medico = Medico(id: "", nome: "dottor", cognome: "boccia", dataNascita: "01/01/01", codiceFiscale: "00100010010010", telefono: "3333333333", email: "email@email.it", tipo: "medico", password: "psw567", specializzazione: "gurobi")
        
        
        
        let p = Paziente()
        
        //        p.creaPaziente(paziente: paziente)
        
//        p.ottieniPazienteDaEmail(emailDaCercare: "kVZgAfgvN0YhuOH3a3rQ"){(pazienti) in
//
//            guard let pazientiRes = pazienti else {
//                print("error")
//                return
//            }
//            for paziente in pazientiRes{
//                print(paziente.nome)
//            }
//
//        }
        
        let m = Medico()
        
        //        m.creaMedico(medico: medico)
        
//        m.ottieniMedicoDaId(idDaCercare: "z9MAfR3569easaCImstB"){(medici) in
//
//            guard let mediciRes = medici else {
//                print("error")
//                return
//            }
//
//            print(mediciRes.nome," ",mediciRes.cognome)
//
//
//        }
        
        let pa = Patologia()
        
        //        pa.ottieniPatologiaDaId(idDaCercare: "HPKmmyFqINSPl3MaPurk"){(patologie) in
        //
        //            guard let patologieRes = patologie else {
        //                print("error")
        //                return
        //            }
        //
        //            print(patologieRes.titolo," ",patologieRes.codiceEsenzione)
        //
        //
        //        }
        
//        pa.ottieniTuttePatologie{(patologie) in
//
//            guard let patologieRes = patologie else {
//                print("error")
//                return
//            }
//            for patologia in patologieRes{
//                print(patologia.id,patologia.titolo,patologia.codiceEsenzione)
//            }
//
//        }
        
        let s = Sintomo()
        let sintomo = Sintomo(id: "", tipo: "mal di testa", descrizione: "mal di testa")
//        s.creaSintomo(sintomo: sintomo)
        
//        s.ottieniSintomoDaId(idDaCercare: "31SUBRjaeefJ6Zi2pFbs"){(sintomi) in
//
//            guard let sintomiRes = sintomi else {
//                print("error")
//                return
//            }
//
//            print(sintomiRes.tipo," ",sintomiRes.descrizione)
//
//
//        }
        
//        s.ottieniTuttiSintomi{(sintomi) in
//            
//            guard let sintomiRes = sintomi else {
//                print("error")
//                return
//            }
//            for sintomo in sintomiRes{
//                print(sintomo.id,sintomo.tipo,sintomo.descrizione)
//            }
//            
//        }
        
        
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
    
}


