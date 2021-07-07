//
//  MedicoViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 05/07/21.
//

import Foundation


class RichiestaViewModel{
    
    init(){}
    
    
    public static func accettaRichiestaAssociazione(idRichiesta: String){
        print("Acceddo la richiesta \(idRichiesta)")
        
        let r = Richiesta()
        
        r.aggiornaStatoRichiesta(idRichiesta: idRichiesta, stato: true)
    }
}

