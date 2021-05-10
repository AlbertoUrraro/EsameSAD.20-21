//
//  Medico.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Medico: Utente{
    //Dichiarazione variabili
    var specializzazione: String
    
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String, specializzazione: String) {
    self.specializzazione = specializzazione
    super.init(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo)
    }
    
    //Funzione set
    func setSpecializzazione(specializzazione: String){self.specializzazione = specializzazione}
    
    //Funzione get
    func getSpecializzazione()->String{return self.specializzazione}
    
    
}
