//
//  MedicoTabBarViewModel.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 09/07/21.
//

import Foundation


class MedicoTabBarViewModel{
    
    //variabili collegamento al model
    var richistaModel = Richiesta()
    
    init(){}
    
    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool, finished: @escaping([Richiesta]?) -> Void) {
        
        richistaModel.ottieniRichiesteDaIdMedico(idDaCercare: idDaCercare,condizione: condizione){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            
            let richiesteArr = richiesteRes
            
            finished(richiesteArr)
        }
    }
}
