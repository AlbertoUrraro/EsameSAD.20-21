//
//  ParametriViewModel.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation


class ParametriViewModel {
    
    //variabile collegamento al model
    var parametroVitaleModel = ParametroVitale()
    var statoSaluteModel = StatoSalute()
    
    init(){}
    
    func creaParametroVitale(parametroVitale: ParametroVitale)->String{
        
        let idParametroVitale = parametroVitaleModel.creaParametroVitale(parametroVitale: parametroVitale)
        
        return idParametroVitale
    }
    
    func creaStatoSalute(statoSalute: StatoSalute){
        
        let idStatoSalute = statoSaluteModel.creaStatoSalute(statoSalute: statoSalute)
        
        return idStatoSalute
    }
}
