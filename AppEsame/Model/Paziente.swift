//
//  Paziente.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Paziente: Utente{
    //Dichiarazione variabili
    var allergie: [String]!
    var patologie: [String]!
    
    //variabile entità DB
    var pazienteDB = PazienteDB()
    
    //Costruttore
    init(id: String,uid: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String, password: String, allergie: [String], patologie: [String], indirizzo: String, citta: String, cap: String) {
        self.allergie = allergie
        self.patologie = patologie
        super.init(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
    }
    
    //Costruttore vuoto
    override init(){
        super.init()
    }
    
    //Funzioni set
    func setAllergia(allergie: [String]){self.allergie = allergie}
    func setPatologie(patologie: [String]){self.patologie = patologie}
    
    //Funzioni get
    func getAllergie()->[String]{return self.allergie}
    func getPatologie()->[String]{return self.patologie}
    
    
    func pazienteEqUtente(utente:Utente){
        self.setId(id: utente.getId())
        self.setUid(id: utente.getUid())
        self.setNome(nome: utente.getNome())
        self.setCognome(cognome: utente.getCognome())
        self.setDataNascita(dataNascita: utente.getDataNascita())
        self.setCodiceFiscale(codiceFiscale: utente.getCodiceFiscale())
        self.setTelefono(telefono: utente.getTelefono())
        self.setEmail(email: utente.getEmail())
        self.setTipo(tipo: utente.getTipo())
        self.setPassword(password: utente.getPassword())
        self.setIndirizzo(indirizzo: getIndirizzo())
        self.setCitta(citta: getCitta())
        self.setCap(cap: getCap())
    }
    
    
    func creaPaziente(paziente: Paziente)->String{
        let pazienteDb = PazienteDB(id: paziente.getId(), uid: paziente.getUid(), nome: paziente.getNome(), cognome: paziente.getCognome(), dataNascita: paziente.getDataNascita(), codiceFiscale: paziente.getCodiceFiscale(), telefono: paziente.getTelefono(), email: paziente.getEmail(), tipo: paziente.getTipo(), password: paziente.getPassword(), allergie: paziente.getAllergie(), patologie: paziente.getPatologie(), indirizzo: paziente.getIndirizzo(), citta: paziente.getCitta(), cap: paziente.getCap())
       
        let  idPaziente = pazienteDB.creaPaziente(pazienteDb: pazienteDb)
        return idPaziente
    }
    
    func ottieniPazienteDaEmail(emailDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        
        pazienteDB.ottieniPazienteDaEmail(emailDaCercare: emailDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            let pazientiArr = pazientiRes.map{(res) ->Paziente in
                
                let id = res.getId()
                let uid = res.getUid()
                let nome = res.getNome()
                let cognome = res.getCognome()
                let dataNascita = res.getDataNascita()
                let codiceFiscale = res.getCodiceFiscale()
                let telefono = res.getTelefono()
                let email = res.getEmail()
                let tipo = res.getTipo()
                let password = res.getPassword()
                let allergie = res.getAllergie()
                let patologie = res.getPatologie()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                let paziente = Paziente(id: id,uid: uid,nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta,cap: cap)
                
                return paziente
                
            }
            finished(pazientiArr)
        }
    }
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping(Paziente?) -> Void) {
        
        pazienteDB.ottieniPazienteDaId(idDaCercare: idDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            let  res = pazientiRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = res.getId()
            let uid = res.getUid()
            let nome = res.getNome()
            let cognome = res.getCognome()
            let dataNascita = res.getDataNascita()
            let codiceFiscale = res.getCodiceFiscale()
            let telefono = res.getTelefono()
            let email = res.getEmail()
            let tipo = res.getTipo()
            let password = res.getPassword()
            let allergie = res.getAllergie()
            let patologie = res.getPatologie()
            let indirizzo = res.getIndirizzo()
            let citta = res.getCitta()
            let cap = res.getCap()
            
            
            
            let paziente = Paziente(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta, cap: cap)
            
            
            //            }
            finished(paziente)
        }
    }
    
    
    func ottieniPazienteDaUid(uidDaCercare: String, finished: @escaping([Paziente]?) -> Void) {
        
        pazienteDB.ottieniPazienteDaUid(uidDaCercare: uidDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            let pazientiArr = pazientiRes.map{(res) ->Paziente in
                
                let id = res.getId()
                let uid = res.getUid()
                let nome = res.getNome()
                let cognome = res.getCognome()
                let dataNascita = res.getDataNascita()
                let codiceFiscale = res.getCodiceFiscale()
                let telefono = res.getTelefono()
                let email = res.getEmail()
                let tipo = res.getTipo()
                let password = res.getPassword()
                let allergie = res.getAllergie()
                let patologie = res.getPatologie()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                let paziente = Paziente(id: id,uid: uid,nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta,cap: cap)
                
                return paziente
                
            }
            finished(pazientiArr)
        }
    }
    
}
