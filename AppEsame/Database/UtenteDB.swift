//
//  UtenteDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 30/05/21.
//

import Foundation

import Foundation
import FirebaseCore
import FirebaseFirestore

class UtenteDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func ottieniUtenteDaEmail(emailDaCercare: String, finished: @escaping([Utente]?) -> Void) {
        db!.collection("utente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let utenti = result.map{ (queryResult) -> Utente in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let uid = data["uid"] as? String ?? ""
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
               
                
                let utente = Utente(id: id,uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: emailDaCercare, tipo: tipo,password: password, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return utente
                
            }
            finished(utenti)
        }
    }
    
    func ottieniUtenteDaUid(uidDaCercare: String, finished: @escaping([Utente]?) -> Void) {
        db!.collection("utente").whereField("uid", isEqualTo: uidDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let utenti = result.map{ (queryResult) -> Utente in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let uid = data["uid"] as? String ?? ""
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let utente = Utente(id: id,uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo,password: password, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return utente
                
            }
            finished(utenti)
        }
    }
    
    
}
