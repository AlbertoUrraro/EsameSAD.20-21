//
//  Step3PazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class Step3PazienteViewModel{
    
    //variabili collegamento al model
    var patologiaModel = Patologia()
    
    init(){}
    
    func ottieniTuttePatologie(finished: @escaping([Patologia]?) -> Void) {
        
        
        patologiaModel.ottieniTuttePatologie{(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            
            let patologieArr = patologieRes
            
            finished(patologieArr)
        }
    }
}
