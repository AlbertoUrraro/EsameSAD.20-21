//
//  Sintomo.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Sintomo{
    
    //Dichiarazione variabili
    var id: String = ""
    var tipo: String = ""
    var descrizione: String = ""
    
    let sintomoDB = SintomoDB()
    
    //Costruttore
    init(id:String, tipo:String, descrizione:String){
        self.id = id
        self.tipo = tipo
        self.descrizione = descrizione
    }
    
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setTipo(tipo: String){self.tipo = tipo}
    func setDescrizione(descrizione: String){self.descrizione = descrizione}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getTipo()->String{return self.tipo}
    func getDescrizione()->String{return self.descrizione}
    
    
    func creaSintomo(sintomo: Sintomo){
        sintomoDB.creaSintomo(sintomo: sintomo)
    }
    
    
    func ottieniSintomoDaId(idDaCercare: String, finished: @escaping(Sintomo?) -> Void) {
        
        sintomoDB.ottieniSintomoDaId(idDaCercare: idDaCercare){(sintomi) in
            
            guard let sintomiRes = sintomi else {
                print("error")
                return
            }
            let  res = sintomiRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let tipo = res.getTipo()
            let descrizione = res.getDescrizione()
            
            
            
            
            let sintomo = Sintomo(id: id, tipo: tipo, descrizione: descrizione)
            
            
            finished(sintomo)
        }
    }
    
    func ottieniTuttiSintomi(finished: @escaping([Sintomo]?) -> Void) {
        
        
        sintomoDB.ottieniTuttiSintomi{(sintomi) in
            
            guard let sintomiRes = sintomi else {
                print("error")
                return
            }
            let sintomiArr = sintomiRes.map{(result) ->Sintomo in
                
                let id = result.getId()
                let tipo = result.getTipo()
                let descrizione = result.getDescrizione()
                
                
                let sintomo = Sintomo(id: id, tipo: tipo, descrizione: descrizione)
                
                return sintomo
                
            }
            finished(sintomiArr)
        }
    }
}
