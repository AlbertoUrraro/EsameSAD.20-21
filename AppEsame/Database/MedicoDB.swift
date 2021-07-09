//
//  File.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 14/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class MedicoDB: UtenteDB{
    
    
    //Dichiarazione variabili
    var specializzazioni: [String] = []
    
    //Costruttore
    init(id: String, uid: String,  nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String,password: String, specializzazioni: [String], indirizzo: String, citta: String, cap: String) {
        self.specializzazioni = specializzazioni
        super.init(id: id, uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
    }
    
    //Costruttore vuoto
    override init(){
        super.init()
    }
    
    //Funzione set
    func setSpecializzazioni(specializzazioni: [String]){self.specializzazioni = specializzazioni}
    
    //Funzione get
    func getSpecializzazioni()->[String]{return self.specializzazioni}
    
    func creaMedico(medicoDb: MedicoDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("utente").addDocument(data: [
            "uid": medicoDb.getUid(),
            "nome": medicoDb.getNome(),
            "cognome": medicoDb.getCognome(),
            "dataNascita": medicoDb.getDataNascita(),
            "codiceFiscale": medicoDb.getCodiceFiscale(),
            "telefono": medicoDb.getTelefono(),
            "email": medicoDb.getEmail(),
            "tipo": medicoDb.getTipo(),
            "password": medicoDb.getPassword(),
            "specializzazioni": medicoDb.getSpecializzazioni(),
            "indirizzo": medicoDb.getIndirizzo(),
            "citta": medicoDb.getCitta(),
            "cap": medicoDb.getCap(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func ottieniMedicoDaEmail(emailDaCercare: String, finished: @escaping([MedicoDB]?) -> Void) {
        db!.collection("utente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> MedicoDB in
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
                let specializzazioni = data["specializzazioni"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let medico = MedicoDB(id: id, uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
    func ottieniMedicoDaId(idDaCercare: String, finished: @escaping([MedicoDB]?) -> Void) {
        db!.collection("utente").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> MedicoDB in
                let data = result
                
                let id = idDaCercare
                let uid = data["uid"] as? String ?? ""
                let nome = data["nome"] as? String ?? ""
                let cognome = data["cognome"] as? String ?? ""
                let dataNascita = data["dataNascita"] as? String ?? ""
                let codiceFiscale = data["codiceFiscale"] as? String ?? ""
                let telefono = data["telefono"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let tipo = data["tipo"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let specializzazioni = data["specializzazioni"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let medico = MedicoDB(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
    
    func ottieniTuttiMedici(finished: @escaping([MedicoDB]?) -> Void) {
        db!.collection("utente").whereField("tipo", isEqualTo: "Medico").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> MedicoDB in
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
                let specializzazioni = data["specializzazioni"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let medico = MedicoDB(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
    func ottieniMedicoDaUid(uidDaCercare: String, finished: @escaping([MedicoDB]?) -> Void) {
        db!.collection("utente").whereField("uid", isEqualTo: uidDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let medici = result.map{ (queryResult) -> MedicoDB in
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
                let specializzazioni = data["specializzazioni"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let medico = MedicoDB(id: id, uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(medici)
        }
    }
    
}
