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
    var medicoModel = Medico()
    
    init(){}
    
    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool, finished: @escaping([Richiesta]?) -> Void) {
        
        medicoModel.ottieniRichiesteDaIdMedico(idDaCercare: idDaCercare,condizione: condizione){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            
            let richiesteArr = richiesteRes
            
            finished(richiesteArr)
        }
    }
}
