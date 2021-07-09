//
//  Step2PazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class Step2PazienteViewModel{
    
    //variabile collegamento al model
    var allergiaModel = Allergia()
    
    
    init(){}
    
    
    func ottieniTutteAllergie(finished: @escaping([Allergia]?) -> Void) {
        
        allergiaModel.ottieniTutteAllergie(){(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            
            let allergieArr = allergieRes
            
            finished(allergieArr)
        }
    }
}
