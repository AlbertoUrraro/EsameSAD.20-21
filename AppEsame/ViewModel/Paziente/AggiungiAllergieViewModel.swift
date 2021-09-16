//
//  AggiungiAllergieViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class AggiungiAllergieViewModel{
    
    
    //variabile collegamento al model
    var allergiaModel = Allergia()
    var statoSaluteModel = StatoSalute()
    
    init(){}
    
    
    func ottieniTutteAllergie(finished: @escaping([Allergia]?) -> Void) {
        
        statoSaluteModel.ottieniTutteAllergie(){(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            
            let allergieArr = allergieRes
            
            finished(allergieArr)
        }
    }
}
