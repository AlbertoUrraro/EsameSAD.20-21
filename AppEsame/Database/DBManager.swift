//
//  DBManager.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 13/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class DBManager{
    
    static let shared = DBManager()
    
    var db : Firestore?
    
    //per user default
    var id:String = ""
    var nome:String = ""
    var cognome:String = ""
    var email:String = ""
    var citta:String = ""
    var tipo: String = ""
    private init(){}
    
    public func openConnection(){
        self.db = Firestore.firestore()
    }
    
    public func setUserDefaultUtenteLoggato(utente: Utente){
        
        let userDefault = UserDefaults.standard
        
        self.id = utente.getId()
        self.nome = utente.getNome()
        self.cognome = utente.getCognome()
        self.email = utente.getEmail()
        self.citta = utente.getCitta()
        self.tipo = utente.getTipo()
        
        userDefault.setValue(self.id, forKey: "id")
        userDefault.setValue(self.nome, forKey: "nome")
        userDefault.setValue(self.cognome, forKey: "cognome")
        userDefault.setValue(self.email, forKey: "email")
        userDefault.setValue(self.citta, forKey: "citta")
        userDefault.setValue(self.tipo, forKey: "tipo")
    }
    
    public func getUserDefaultUtenteLoggato(){
        let userDefault = UserDefaults.standard
        self.id = userDefault.object(forKey: "id") as? String ?? ""
        self.nome = userDefault.object(forKey: "nome") as? String ?? ""
        self.cognome = userDefault.object(forKey: "cognome") as? String ?? ""
        self.email = userDefault.object(forKey: "email") as? String ?? ""
        self.citta = userDefault.object(forKey: "citta") as? String ?? ""
        self.tipo = userDefault.object(forKey: "tipo") as? String ?? ""
        
    }
    
}
