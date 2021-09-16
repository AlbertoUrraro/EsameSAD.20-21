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
    
    func ottieniCartellaClinicaDaIdUtente(idDaCercare: String, finished: @escaping([CartellaClinica]?) -> Void) {
        
        pazienteDB.ottieniCartellaClinicaDaIdUtente(idDaCercare: idDaCercare){(cartelleCliniche) in
            
            guard let cartelleClinicheRes = cartelleCliniche else {
                print("error")
                return
            }
            let cartelleClinicheArr = cartelleClinicheRes.map{(res) ->CartellaClinica in
                
                let id = res.getId()
                let idUtente = res.getIdUtente()
                let allergie = res.getAllergie()
                let patologie = res.getPatologie()
                let operazioni = res.getOperazioni()
                
                
                
                
                
                let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
                
                return cartellaClinica
                
            }
            finished(cartelleClinicheArr)
        }
    }
    
    func ottieniTerapiaFarmacologicaDaId(idDaCercare: String, finished: @escaping(TerapiaFarmacologica?) -> Void) {
        
        pazienteDB.ottieniTerapiaFarmacologicaDaId(idDaCercare: idDaCercare){(terapieFarmacologiche) in
            
            guard let terapieFarmacologicheRes = terapieFarmacologiche else {
                print("error")
                return
            }
            let  res = terapieFarmacologicheRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let istruzioni = res.getIstruzioni()
            let ricetta = res.getRicetta()
            let farmaci = res.getFarmaci()
            let intervalloOrario = res.getIntervalloOrario()
            
            
            
            let terapiaFarmacologica = TerapiaFarmacologica(id: id, istruzioni: istruzioni, ricetta: ricetta, farmaci: farmaci, intervalloOrario: intervalloOrario)
            
            
            finished(terapiaFarmacologica)
        }
    }
    
    func ottieniStatoSaluteDaId(idDaCercare: String, finished: @escaping(StatoSalute?) -> Void) {
        
        pazienteDB.ottieniStatoSaluteDaId(idDaCercare: idDaCercare){(statiSalute) in
            
            guard let statiSaluteRes = statiSalute else {
                print("error")
                return
            }
            let  res = statiSaluteRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let idPaziente = res.getIdPaziente()
            let data = res.getData()
            let ora = res.getOra()
            let parametriVitali = res.getParametriVitali()
            let sintomi = res.getSintomi()
            
            
            let statoSalute = StatoSalute(id: id, idPaziente: idPaziente, data: data, ora: ora, parametriVitali: parametriVitali, sintomi: sintomi)
            
            finished(statoSalute)
        }
    }
    
    
    func creaCartellaClinica(cartellaClinica: CartellaClinica)->String{
        
        let cartellaClinicaDb = CartellaClinicaDB(id: cartellaClinica.getId(), idUtente: cartellaClinica.getIdUtente(), patologie: cartellaClinica.getPatologie(), allergie: cartellaClinica.getPatologie(), operazioni: cartellaClinica.getOperazioni())
        
        
        let  idCartellaClinica = pazienteDB.creaCartellaClinica(cartellaClinicaDb: cartellaClinicaDb)
        return idCartellaClinica
    }
    
    
    func ottieniCartellaClinicaDaId(idDaCercare: String, finished: @escaping(CartellaClinica?) -> Void) {
        
        pazienteDB.ottieniCartellaClinicaDaId(idDaCercare: idDaCercare){(cartelleCliniche) in
            
            guard let cartelleClinicheRes = cartelleCliniche else {
                print("error")
                return
            }
            let  res = cartelleClinicheRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let idUtente = res.getIdUtente()
            let patologie = res.getPatologie()
            let allergie = res.getAllergie()
            let operazioni = res.getOperazioni()
            
            
            
            let cartellaClinica = CartellaClinica(id: id, idUtente: idUtente, patologie: patologie, allergie: allergie, operazioni: operazioni)
            
            finished(cartellaClinica)
        }
    }
    
    
    
}
