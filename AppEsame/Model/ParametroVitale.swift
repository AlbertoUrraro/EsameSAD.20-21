//
//  ParametroVitale.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 10/07/21.
//

import Foundation

class ParametroVitale{
    
    //Dichiarazione variabili
    var id: String = ""
    var nome: String = ""
    var valore: Float = 0
    var sogliaMinima: Float = 0
    var sogliaMassima: Float = 0
    var data: String = ""
    var ora: String = ""
    var emergenza: Bool = false
    var priorita: Int = 0
    
    let parametroVitaleDB = ParametroVitaleDB()
    
    //Costruttore
    init(id:String, nome: String, valore: Float, sogliaMinima: Float, sogliaMassima: Float, data: String, ora: String, emergenza: Bool, priorita: Int){
        self.id = id
        self.nome = nome
        self.valore = valore
        self.sogliaMinima = sogliaMinima
        self.sogliaMassima = sogliaMassima
        self.data = data
        self.ora = ora
        self.emergenza = emergenza
        self.priorita = priorita
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setNome(nome: String){self.nome = nome}
    func setValore(valore: Float){self.valore = valore}
    func setSogliaMinima(sogliaMinima: Float){self.sogliaMinima = sogliaMinima}
    func setSogliaMassima(sogliaMassima: Float){self.sogliaMassima = sogliaMassima}
    func setData(data: String){self.data = data}
    func setOra(ora: String){self.ora = ora}
    func setEmergenza(emergenza: Bool){self.emergenza = emergenza}
    func setPriorita(priorita: Int){self.priorita = priorita}
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getNome()->String{return self.nome}
    func getValore()->Float{return self.valore}
    func getSogliaMinima()->Float{return self.sogliaMinima}
    func getSogliaMassima()->Float{return self.sogliaMassima}
    func getData()->String{return self.data}
    func getOra()->String{return self.ora}
    func getEmergenza()->Bool{return self.emergenza}
    func getPriorita()->Int{return self.priorita}
    
    func creaParametroVitale(parametroVitale: ParametroVitale)->String{
        
        let parametroVitaleDb = ParametroVitaleDB(id: parametroVitale.getId(), nome: parametroVitale.getNome(), valore: parametroVitale.getValore(), sogliaMinima: parametroVitale.getSogliaMinima(), sogliaMassima: parametroVitale.getSogliaMassima(), data: parametroVitale.getData(), ora: parametroVitale.getOra(), emergenza: parametroVitale.getEmergenza(), priorita: parametroVitale.getPriorita())
        
        let idParam = parametroVitaleDB.creaParametroVitale(parametroVitaleDb: parametroVitaleDb)
        
        return idParam
    }
    
    
    
    
}
