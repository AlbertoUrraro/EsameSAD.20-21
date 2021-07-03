//
//  RegistrazioneViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 11/05/21.
//

import Foundation
import UIKit
import FirebaseAuth


class RegistrazioneViewModel{
    
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
    
    public static func completaRegistrazionePaziente(pazienteStep3: Paziente,mediciSelezionati: [String]){
        
        Auth.auth().createUser(withEmail: pazienteStep3.getEmail(), password: pazienteStep3.getPassword()) { authResult, error in
            let p = Paziente()
            let r = Richiesta()
            pazienteStep3.setUid(id: authResult?.user.uid ?? "")
            let idPaziente = p.creaPaziente(paziente: pazienteStep3)
            for medico in mediciSelezionati{
                let richiesta = Richiesta(id: "", idPaziente: idPaziente, idMedico: medico, stato: false)
                r.creaRichiesta(richiesta: richiesta)
            }
        }
        
    }
    
    public static func completaRegistrazione(medicoStep1: Utente, specializzazioniSelezionate: [String]){
        
        
        Auth.auth().createUser(withEmail: medicoStep1.getEmail(), password: medicoStep1.getPassword()) { authResult, error in
            let m = Medico()
            var medico = Medico()
            medico.medicoEqUtente(utente: medicoStep1)
            medico.setUid(id: authResult?.user.uid ?? "")
            medico.setSpecializzazioni(specializzazioni: specializzazioniSelezionate)
            
            m.creaMedico(medico: medico)
        }
    }
    
}
