//
//  Paziente.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Paziente: Utente{
    //Dichiarazione variabili
    var allergia: String
    var patologie: [Patologia]!
    
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String, allergia: String, patologie: [Patologia]) {
        self.allergia = allergia
        self.patologie = patologie
        super.init(id: id, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo)
    }
    
    //Funzioni set
    func setAllergia(allergia: String){self.allergia = allergia}
    func setPatologie(patologie: [Patologia]){self.patologie = patologie}
    
    //Funzioni get
    func getAllergia()->String{return self.allergia}
    func getPatologie()->[Patologia]{return self.patologie}
    
}