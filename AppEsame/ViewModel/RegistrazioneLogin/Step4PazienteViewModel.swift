//
//  Step4PazienteViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation

class Step4PazienteViewModel{
    
    //variabili collegamento al model
    var medicoModel = Medico()
    
    
    init(){}
    
    func ottieniTuttiMedici(finished: @escaping([Medico]?) -> Void) {
        
        
        medicoModel.ottieniTuttiMedici{(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let mediciArr = mediciRes
            
            finished(mediciArr)
        }
    }
}
