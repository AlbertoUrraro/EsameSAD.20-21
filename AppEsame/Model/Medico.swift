//
//  Medico.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Medico: Utente{
    //Dichiarazione variabili
    var specializzazione: String = ""
    
    //variabile entità DB
    var medicoDB = MedicoDB()
    
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String,password: String, specializzazione: String, indirizzo: String, citta: String, cap: String) {
        self.specializzazione = specializzazione
        super.init(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
    }
    
    //Costruttore vuoto
    override init(){
        super.init()
    }
    
    //Funzione set
    func setSpecializzazione(specializzazione: String){self.specializzazione = specializzazione}
    
    //Funzione get
    func getSpecializzazione()->String{return self.specializzazione}
    
    
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
                
                let nome = res.getNome()
                let cognome = res.getCognome()
                let dataNascita = res.getDataNascita()
                let codiceFiscale = res.getCodiceFiscale()
                let telefono = res.getTelefono()
                let email = res.getEmail()
                let tipo = res.getTipo()
                let password = res.getPassword()
                let specializzazione = res.getSpecializzazione()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                
                let medico = Medico(id: "",nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazione: specializzazione, indirizzo: indirizzo, citta: citta, cap: cap)
                
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
            let specializzazione = res.getSpecializzazione()
            let indirizzo = res.getIndirizzo()
            let citta = res.getCitta()
            let cap = res.getCap()
            
            
            
            
            let medico = Medico(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazione: specializzazione, indirizzo: indirizzo, citta: citta, cap: cap)
            
            
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
                let specializzazione = result.getSpecializzazione()
                let indirizzo = result.getIndirizzo()
                let citta = result.getCitta()
                let cap = result.getCap()
                
                
                let medico = Medico(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazione: specializzazione, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    
}
