//
//  Medico.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Medico: Utente{
    //Dichiarazione variabili
    var specializzazioni: [String] = []
    
    //variabile entità DB
    var medicoDB = MedicoDB()
    
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String,password: String, specializzazioni: [String], indirizzo: String, citta: String, cap: String) {
        self.specializzazioni = specializzazioni
        super.init(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
    }
    
    //Costruttore vuoto
    override init(){
        super.init()
    }
    
    //Funzione set
    func setSpecializzazioni(specializzazioni: [String]){self.specializzazioni = specializzazioni}
    
    //Funzione get
    func getSpecializzazioni()->[String]{return self.specializzazioni}
    
    
    func medicoEqUtente(utente:Utente){
        self.setId(id: utente.getId())
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
    
    
    func creaMedico(medico: Medico){
        medicoDB.creaMedico(medico: medico)
    }
    
    func ottieniMedicoDaEmail(emailDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        
        medicoDB.ottieniMedicoDaEmail(emailDaCercare: emailDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            let mediciArr = mediciRes.map{(res) ->Medico in
                
                let id = res.getId()
                let nome = res.getNome()
                let cognome = res.getCognome()
                let dataNascita = res.getDataNascita()
                let codiceFiscale = res.getCodiceFiscale()
                let telefono = res.getTelefono()
                let email = res.getEmail()
                let tipo = res.getTipo()
                let password = res.getPassword()
                let specializzazioni = res.getSpecializzazioni()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                
                let medico = Medico(id: id,nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    func ottieniMedicoDaId(idDaCercare: String, finished: @escaping(Medico?) -> Void) {
        
        medicoDB.ottieniMedicoDaId(idDaCercare: idDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let  res = mediciRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = res.id
            let nome = res.getNome()
            let cognome = res.getCognome()
            let dataNascita = res.getDataNascita()
            let codiceFiscale = res.getCodiceFiscale()
            let telefono = res.getTelefono()
            let email = res.getEmail()
            let tipo = res.getTipo()
            let password = res.getPassword()
            let specializzazioni = res.getSpecializzazioni()
            let indirizzo = res.getIndirizzo()
            let citta = res.getCitta()
            let cap = res.getCap()
            
            
            
            
            let medico = Medico(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
            
            
            finished(medico)
        }
    }
    
    func ottieniTuttiMedici(finished: @escaping([Medico]?) -> Void) {
        
        
        medicoDB.ottieniTuttiMedici{(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            let mediciArr = mediciRes.map{(result) ->Medico in
                
                let id = result.getId()
                let nome = result.getNome()
                let cognome = result.getCognome()
                let dataNascita = result.getDataNascita()
                let codiceFiscale = result.getCodiceFiscale()
                let telefono = result.getTelefono()
                let email = result.getEmail()
                let tipo = result.getTipo()
                let password = result.getPassword()
                let specializzazioni = result.getSpecializzazioni()
                let indirizzo = result.getIndirizzo()
                let citta = result.getCitta()
                let cap = result.getCap()
                
                
                let medico = Medico(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    
}
