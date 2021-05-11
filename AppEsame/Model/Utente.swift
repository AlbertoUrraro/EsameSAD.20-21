//
//  Utente.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Utente{
    //Dichiarazione variabili
    var id: String
    var nome: String
    var cognome: String
    var dataNascita: String
    var codiceFiscale: String
    var telefono: String
    var email: String
    var tipo: String
    var ciao:String
    //Costruttore
    init(id: String, nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String){
        self.id = id
        self.nome = nome
        self.cognome = cognome
        self.dataNascita = dataNascita
        self.codiceFiscale = codiceFiscale
        self.telefono = telefono
        self.email = email
        self.tipo = tipo
    }
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setNome(nome: String){self.nome = nome}
    func setCognome(cognome: String){self.cognome = cognome}
    func setDataNascita(dataNascita: String){self.dataNascita = dataNascita}
    func setCodiceFiscale(codiceFiscale: String){self.codiceFiscale = codiceFiscale}
    func setTelefono(telefono: String){self.telefono = telefono}
    func setEmail(email: String){self.email = email}
    func setTipo(tipo: String){self.tipo = tipo}
    
    //Funzione get
    func getId()->String{return self.id}
    func getNome()->String{return self.nome}
    func getCognome()->String{return self.cognome}
    func getDataNascita()->String{return self.dataNascita}
    func getCodiceFiscale()->String{return self.codiceFiscale}
    func getTelefono()->String{return self.telefono}
    func getEmail()->String{return self.email}
    func getTipo()->String{return self.tipo}
    
    
}
