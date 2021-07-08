//
//  UtenteViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 08/07/21.
//

import Foundation


class UtenteViewModel{
    
    //variabile collegamento al model
    var utenteModel = Utente()
    
    init(){}
    
    func ottieniUtenteDaEmail(emailDaCercare: String, finished: @escaping([Utente]?) -> Void) {
        
        utenteModel.ottieniUtenteDaEmail(emailDaCercare: emailDaCercare){(utenti) in
            
            guard let utentiRes = utenti else {
                print("error")
                return
            }
            
            let utentiArr = utentiRes
            
            finished(utentiArr)
        }
    }
    
    func ottieniUtenteDaUid(uidDaCercare: String, finished: @escaping([Utente]?) -> Void) {
        
        utenteModel.ottieniUtenteDaUid(uidDaCercare: uidDaCercare){(utenti) in
            
            guard let utentiRes = utenti else {
                print("error")
                return
            }
            
            let utentiArr = utentiRes
            
            finished(utentiArr)
        }
    }
    
}
