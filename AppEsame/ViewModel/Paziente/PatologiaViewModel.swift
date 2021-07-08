//
//  PatologiaViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 08/07/21.
//

import Foundation

class PatologiaViewModel{
    
    
    //variabile collegamento al model
    var patologiaModel = Patologia()
    
    init(){}
    
    func ottieniPatologiaDaId(idDaCercare: String, finished: @escaping(Patologia?) -> Void) {
        
        patologiaModel.ottieniPatologiaDaId(idDaCercare: idDaCercare){(patologie) in
            
            guard let patologieRes = patologie else {
                print("error")
                return
            }
            
            let patologia = patologieRes
            
            finished(patologia)
        }
    }
    
    
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
