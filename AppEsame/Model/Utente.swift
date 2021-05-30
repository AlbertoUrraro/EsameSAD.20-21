//
//  Utente.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Utente{
    //Dichiarazione variabili
    var id: String = ""
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
    
    //variabile entità DB
    var utenteDB = UtenteDB()
    
    
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String, password: String, indirizzo: String, citta: String, cap: String){
        self.id = id
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
    
    
    func ottieniUtenteDaEmail(emailDaCercare: String, finished: @escaping([Utente]?) -> Void) {
        
        utenteDB.ottieniUtenteDaEmail(emailDaCercare: emailDaCercare){(utenti) in
            
            guard let utentiRes = utenti else {
                print("error")
                return
            }
            let utentiArr = utentiRes.map{(res) ->Utente in
                
                let nome = res.getNome()
                let cognome = res.getCognome()
                let dataNascita = res.getDataNascita()
                let codiceFiscale = res.getCodiceFiscale()
                let telefono = res.getTelefono()
                let email = res.getEmail()
                let tipo = res.getTipo()
                let password = res.getPassword()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                
                let utente = Utente(id: "",nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return utente
                
            }
            finished(utentiArr)
        }
    }
    
    
}
