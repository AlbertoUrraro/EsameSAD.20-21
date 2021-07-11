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
    
    //Dichiarazione variabili
    var id: String = ""
    var uid: String = ""
    var nome: String = ""
    var cognome: String  = ""
    var dataNascita: String  = ""
    var codiceFiscale: String  = ""
    var telefono: String  = ""
    var email: String  = ""
    var tipo: String  = ""
    var password: String  = ""
    var indirizzo: String = ""
    var citta: String = ""
    var cap: String = ""
    
    //Costruttore
    init(id: String, uid: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String, password: String, indirizzo: String, citta: String, cap: String){
        self.id = id
        self.uid = uid
        self.nome = nome
        self.cognome = cognome
        self.dataNascita = dataNascita
        self.codiceFiscale = codiceFiscale
        self.telefono = telefono
        self.email = email
        self.tipo = tipo
        self.password = password
        self.indirizzo = indirizzo
        self.citta = citta
        self.cap = cap
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setUid(id: String){self.uid = id}
    func setNome(nome: String){self.nome = nome}
    func setCognome(cognome: String){self.cognome = cognome}
    func setDataNascita(dataNascita: String){self.dataNascita = dataNascita}
    func setCodiceFiscale(codiceFiscale: String){self.codiceFiscale = codiceFiscale}
    func setTelefono(telefono: String){self.telefono = telefono}
    func setEmail(email: String){self.email = email}
    func setTipo(tipo: String){self.tipo = tipo}
    func setPassword(password: String){self.password = password}
    func setIndirizzo(indirizzo: String){self.indirizzo = indirizzo}
    func setCitta(citta: String){self.citta = citta}
    func setCap(cap: String){self.cap = cap}
    
    //Funzione get
    func getId()->String{return self.id}
    func getUid()->String{return self.uid}
    func getNome()->String{return self.nome}
    func getCognome()->String{return self.cognome}
    func getDataNascita()->String{return self.dataNascita}
    func getCodiceFiscale()->String{return self.codiceFiscale}
    func getTelefono()->String{return self.telefono}
    func getEmail()->String{return self.email}
    func getTipo()->String{return self.tipo}
    func getPassword()->String{return self.password}
    func getIndirizzo()->String{return self.indirizzo}
    func getCitta()->String{return self.citta}
    func getCap()->String{return self.cap}
    
    
    
    func ottieniUtenteDaEmail(emailDaCercare: String, finished: @escaping([UtenteDB]?) -> Void) {
        db!.collection("utente").whereField("email", isEqualTo: emailDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let utenti = result.map{ (queryResult) -> UtenteDB in
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
                
                
                let utente = UtenteDB(id: id,uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: emailDaCercare, tipo: tipo,password: password, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return utente
                
            }
            finished(utenti)
        }
    }
    
    func ottieniUtenteDaUid(uidDaCercare: String, finished: @escaping([UtenteDB]?) -> Void) {
        db!.collection("utente").whereField("uid", isEqualTo: uidDaCercare).getDocuments() { (queryResult, err) in
            guard let result = queryResult?.documents else {
                print("No documents")
                return
            }
            
            let utenti = result.map{ (queryResult) -> UtenteDB in
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
                
                let utente = UtenteDB(id: id,uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo,password: password, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return utente
                
            }
            finished(utenti)
        }
    }
    
    
}
