//
//  UtenteDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 13/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class PazienteDB{
    
    let db = DBManager.shared.db
    
    init(){}
    
    func creaPaziente(paziente: Paziente)->String{
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("utente").addDocument(data: [
            "nome": paziente.getNome(),
            "cognome": paziente.getCognome(),
            "dataNascita": paziente.getDataNascita(),
            "codiceFiscale": paziente.getCodiceFiscale(),
            "telefono": paziente.getTelefono(),
            "email": paziente.getEmail(),
            "tipo": paziente.getTipo(),
            "password": paziente.getPassword(),
            "allergie": paziente.getAllergie(),
            "patologie": paziente.getPatologie(),
            "indirizzo": paziente.getIndirizzo(),
            "citta": paziente.getCitta(),
            "cap": paziente.getCap(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
            }
            
        }
        return ref!.documentID
    }
    
    func ottieniPazienteDaEmail(emailDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        db!.collection("utente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let pazienti = result.map{ (queryResult) -> Paziente in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let allergie = data["allergie"] as? [String] ?? []
                let patologie = data["patologie"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let paziente = Paziente(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return paziente
                
            }
            finished(pazienti)
        }
    }
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        db!.collection("utente").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let pazienti = result.map{ (queryResult) -> Paziente in
                let data = result
                
                let id = idDaCercare
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let allergie = data["allergie"] as? [String] ?? []
                let patologie = data["patologie"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let paziente = Paziente(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return paziente
                
            }
            finished(pazienti)
        }
    }
    
    
}
