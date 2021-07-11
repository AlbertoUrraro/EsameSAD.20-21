//
//  LoginViewModel.swift
//  AppEsame
//
//  Created by Anna on 11/05/2021.
//

import Foundation
import UIKit
import FirebaseUI

class LoginViewModel{
    
    init(){
    }
    
    //Valida il login in un if controlla un campo per volta
    public static func validaLogin(email:String, password:String)->Errore{
        
        let errore = Errore(errore: false,descrizione: "")
        
        if (errore.calcolaErrore(errore: errore,nome: "email", valore: email)){
            return errore
        }
        else if (errore.calcolaErrore(errore: errore, nome: "password", valore: password))
        {
            return errore
        }
        return errore
    }
    
    public static func appLogin(view: UIViewController, email: String,  password: String, this: UIViewController){
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak this] authResult, error in
            print(authResult?.user.uid)
            
            let u = Utente()
            
            u.ottieniUtenteDaUid(uidDaCercare: authResult?.user.uid ?? ""){(utenti) in
                
                guard let utentiRes = utenti else {
                    print("error")
                    return
                }
                if(utentiRes.count == 0){
                    //Popup di errore
                    let alertLogin = UIAlertController(title: "Errore", message: "Email o password errata!", preferredStyle: UIAlertController.Style.alert)
                    alertLogin.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (act) in
                        //Eventuale azione
                    }))
                    view.present(alertLogin,animated: true, completion: nil)
                } else {
                        if(utentiRes[0].getTipo() == "Paziente"){
                            view.performSegue(withIdentifier: "LoginPaziente", sender: self)
                        } else {
                            view.performSegue(withIdentifier: "LoginMedico", sender: self)
                        }
                        DBManager.shared.setUserDefaultUtenteLoggato(utente: utentiRes[0])

                    
                }
                
                
            }
        }
        
        
    }
}
