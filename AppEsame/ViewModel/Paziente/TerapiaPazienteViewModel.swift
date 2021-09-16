//
//  TerapiaPaziente.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation


class TerapiaPazienteViewModel{
    
    var pazienteModel = Paziente()
    
    
    func visualizzaStoricoTerapie(idPaziente: String, finished: @escaping(TerapiaFarmacologica?) -> Void) {
        
        pazienteModel.ottieniTerapiaFarmacologicaDaId(idDaCercare: idPaziente){(terapie) in
            
            guard let terapieRes = terapie else {
                print("error")
                return
            }
            
            let terapia = terapieRes
            
            finished(terapia)
        }
    }
}
