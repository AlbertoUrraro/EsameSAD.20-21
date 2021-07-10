//
//  StatoSalute.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 10/07/21.
//

import Foundation


class StatoSalute{
    
    
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var data: String = ""
    var ora: String = ""
    var parametriVitali: [String] = []
    var sintomi: [String] = []
    
    let statoSaluteDB = StatoSaluteDB()
    
    //Costruttore
    init(id:String, idPaziente:String, data: String, ora: String, parametriVitali:[String], sintomi:[String]){
        self.id = id
        self.idPaziente = idPaziente
        self.data = data
        self.ora = ora
        self.parametriVitali = parametriVitali
        self.sintomi = sintomi
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    func setData(data: String){self.data = data}
    func setOra(ora: String){self.ora = ora}
    func setParametriVitali(parametriVitali: [String]){self.parametriVitali = parametriVitali}
    func setSintomi(sintomi: [String]){self.sintomi = sintomi}
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdPaziente()->String{return self.idPaziente}
    func getData()->String{return self.data}
    func getOra()->String{return self.ora}
    func getParametriVitali()->[String]{return self.parametriVitali}
    func getSintomi()->[String]{return self.sintomi}
    
    
    func creaStatoSalute(statoSalute: StatoSalute){
        
        let statoSaluteDb = StatoSaluteDB(id: statoSalute.getId(), idPaziente: statoSalute.getIdPaziente(), data: statoSalute.getData(), ora: statoSalute.getOra(), parametriVitali: statoSalute.getParametriVitali(), sintomi: statoSalute.getSintomi())
        
        statoSaluteDB.creaStatoSalute(statoSaluteDb: statoSaluteDb)
    }
    
    
    func ottieniStatoSaluteDaId(idDaCercare: String, finished: @escaping(StatoSalute?) -> Void) {
        
        statoSaluteDB.ottieniStatoSaluteDaId(idDaCercare: idDaCercare){(statiSalute) in
            
            guard let statiSaluteRes = statiSalute else {
                print("error")
                return
            }
            let  res = statiSaluteRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let idPaziente = res.getIdPaziente()
            let data = res.getData()
            let ora = res.getOra()
            let parametriVitali = res.getParametriVitali()
            let sintomi = res.getSintomi()
            
            
            let statoSalute = StatoSalute(id: id, idPaziente: idPaziente, data: data, ora: ora, parametriVitali: parametriVitali, sintomi: sintomi)
            
            finished(statoSalute)
        }
    }
    
    
}
