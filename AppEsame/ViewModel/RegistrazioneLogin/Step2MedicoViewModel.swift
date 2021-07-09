//
//  Step2MedicoViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation


class Step2MedicoViewModel{
    
    
    //variabili collegamento al model
    var specializzazioneModel = Specializzazione()
    
    init(){
        
    }
    
    
    func ottieniTutteSpecializzazioni(finished: @escaping([Specializzazione]?) -> Void) {
        
        
        specializzazioneModel.ottieniTutteSpecializzazioni{(specializzazioni) in
            
            guard let specializzazioniRes = specializzazioni else {
                print("error")
                return
            }
            
            let specializzazioniArr = specializzazioniRes
            
            finished(specializzazioniArr)
        }
        
    }
}
