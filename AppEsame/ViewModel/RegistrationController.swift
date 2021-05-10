//
//  RegistrationController.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit


class RegistrazioneController{
    
    init(){
        
    }
    
    public static func validaStep1Registrazione(nome: String, cognome: String, codiceFiscale: String, telefono: String, email: String, password: String, ripetiPasword: String)->Errore{
        
        let errore = Errore(errore: false,descrizione: "")
        
        var flagErrore = false
        var descrizioneErrore = ""
        
        if(nome == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo nome vuoto,"
        }
        if(cognome == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo cognome vuoto,"
        }
        if(codiceFiscale == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo codice fiscale vuoto,"
        }
        if(telefono == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo telefono vuoto,"
        }
        if(email == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo email vuoto,"
        }
        if(password == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo password vuoto,"
        }
        if(ripetiPasword == ""){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Campo ripeti password vuoto,"
        }
        
        if(password != ripetiPasword){
            flagErrore = true
            descrizioneErrore = descrizioneErrore + "Le password inserite non corrispondono,"
        }
        
        errore.setErrore(errore: flagErrore)
        errore.setDescrizione(descrizione: descrizioneErrore)
        
        return errore
    }
    
}
