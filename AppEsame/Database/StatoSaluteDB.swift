//
//  StatoSaluteDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 10/07/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore



class StatoSaluteDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var data: String = ""
    var ora: String = ""
    var parametriVitali:[String] = []
    var sintomi: [String] = []
    
    let db = DBManager.shared.db
    
    //Costruttore
    init(id:String, idPaziente:String, data: String, ora: String, parametriVitali:[String], sintomi:[String]){
        self.id = id
        self.idPaziente = idPaziente
        self.data = data
        self.ora = ora
        self.parametriVitali = parametriVitali
        self.sintomi = sintomi
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    func setData(data: String){self.data = data}
    func setOra(ora: String){self.ora = ora}
    func setParametriVitali(parametriVitali: [String]){self.parametriVitali = parametriVitali}
    func setSintomi(sintomi: [String]){self.sintomi = sintomi}
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdPaziente()->String{return self.idPaziente}
    func getData()->String{return self.data}
    func getOra()->String{return self.ora}
    func getParametriVitali()->[String]{return self.parametriVitali}
    func getSintomi()->[String]{return self.sintomi}
    
    
    func creaStatoSalute(statoSaluteDb: StatoSaluteDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("statoSalute").addDocument(data: [
            "idPaziente": statoSaluteDb.getIdPaziente(),
            "data": statoSaluteDb.getData(),
            "ora": statoSaluteDb.getOra(),
            "parametriVitali": statoSaluteDb.getParametriVitali(),
            "sintomi": statoSaluteDb.getSintomi(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    

    
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping([PazienteDB]?) -> Void) {
        db!.collection("utente").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let pazienti = result.map{ (queryResult) -> PazienteDB in
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
                let allergie = data["allergie"] as? [String] ?? []
                let patologie = data["patologie"] as? [String] ?? []
                let indirizzo = data["indirizzo"] as? String ?? ""
                let citta = data["citta"] as? String ?? ""
                let cap = data["cap"] as? String ?? ""
                
                let paziente = PazienteDB(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return paziente
                
            }
            finished(pazienti)
        }
    }
    
    
    func ottieniTutteAllergie(finished: @escaping([AllergiaDB]?) -> Void) {
        db!.collection("allergia").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let allergie = result.map{ (queryResult) -> AllergiaDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let titolo = data["titolo"] as? String ?? ""
                
                let allergia = AllergiaDB(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergie)
        }
    }
    
    func ottieniTuttiSintomi(finished: @escaping([SintomoDB]?) -> Void) {
        db!.collection("sintomo").getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let sintomi = result.map{ (queryResult) -> SintomoDB in
                let data = queryResult.data()
                
                let id = queryResult.documentID
                let tipo = data["tipo"] as? String ?? ""
                let descrizione = data["descrizione"] as? String ?? ""
                
                let sintomo = SintomoDB(id: id, tipo: tipo,descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomi)
        }
    }
    
    func ottieniParametroVitaleDaId(idDaCercare: String, finished: @escaping([ParametroVitaleDB]?) -> Void) {
        db!.collection("parametroVitale").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let parametriVitali = result.map{ (queryResult) -> ParametroVitaleDB in
                let data = result
                
                let id = idDaCercare
                let nome = data["nome"] as? String ?? ""
                let valore = data["valore"] as? Float ?? 0
                let sogliaMinima = data["sogliaMinima"] as? Float ?? 0
                let sogliaMassima = data["sogliaMassima"] as? Float ?? 0
                let data_ = data["data"] as? String ?? ""
                let ora = data["ora"] as? String ?? ""
                let emergenza = data["emergenza"] as? Bool ?? false
                let priorita = data["priorita"] as? Int ?? 0
                
                
                let parametroVitale = ParametroVitaleDB(id: id, nome: nome, valore: valore, sogliaMinima: sogliaMinima, sogliaMassima: sogliaMassima, data: data_, ora: ora, emergenza: emergenza, priorita: priorita)
                
                return parametroVitale
                
            }
            finished(parametriVitali)
        }
    }
    
}
