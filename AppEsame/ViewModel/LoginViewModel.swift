//
//  LoginViewModel.swift
//  AppEsame
//
//  Created by Anna on 11/05/2021.
//

import Foundation

class LoginViewModel{
    
    init(){
    }
    
    //Valida il login in un if controlla un campo per volta
    public static func validaLogin(email:String, password:String)->Errore{
        
        let errore = Errore(errore: false,descrizione: "")
        
        if (errore.calcolaErrore(errore: errore,nome: "email", valore: email)){
            return errore
        }
        else if (errore.calcolaErrore(errore: errore, nome: "password", valore: password))
        {
            return errore
        }
        return errore
    }
}
