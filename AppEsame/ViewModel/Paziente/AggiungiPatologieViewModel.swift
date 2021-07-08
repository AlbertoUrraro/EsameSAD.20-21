//
//  AggiungiPatologieViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 08/07/21.
//


import Foundation

class AggiungiPatologieViewModel{
    
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
