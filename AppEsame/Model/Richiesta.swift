//
//  Richiesta.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Richiesta{
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var idMedico: String = ""
    var stato: Bool = false
    
    //variabile entità DB
    var richiestaeDB = RichiestaDB()
    
    //Costruttore
    init(id:String, idPaziente: String, idMedico: String, stato: Bool){
        self.id = id
        self.idPaziente = idPaziente
        self.idMedico = idMedico
        self.stato = stato
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdPaziente(idPaziente: String){self.idPaziente = idPaziente}
    func setIdMedico(idMedico: String){self.idMedico = idMedico}
    func setIdStato(stato: Bool){self.stato = stato}

    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdPaziente()->String{return self.idPaziente}
    func getIdMedico()->String{return self.idMedico}
    func getStato()->Bool{return self.stato}
    
    
    func creaRichiesta(richiesta: Richiesta){
        richiestaeDB.creaRichiesta(richiesta: richiesta)
    }



    
}
