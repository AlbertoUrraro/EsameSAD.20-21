//
//  Rubrica.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation


class Rubrica{
    
    var id: String = ""
    var idUtente: String = ""
    var contatti:[String] = []
    
    let rubricaDB = RubricaDB()
    
    //Costruttore
    init(id: String, idUtente: String, contatti: [String]){
        self.id = id
        self.idUtente = idUtente
        self.contatti = contatti
    }
    
    //Costruttore vuoto
    init(){}
    
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setIdUtente(idUtente: String){self.idUtente = idUtente}
    func setContatti(contatti:[String]){self.contatti = contatti}
    
    //Funzioni get
    func getId()->String{return self.id}
    func getIdUtente()->String{return self.idUtente}
    func getContatti()->[String]{return self.contatti}
    
    
    func ottieniRubricaDaId(idDaCercare: String, finished: @escaping(Rubrica?) -> Void) {
        
        rubricaDB.ottieniRubricaDaId(idDaCercare: idDaCercare){(rubriche) in
            
            guard let rubricheRes = rubriche else {
                print("error")
                return
            }
            let  res = rubricheRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let idUtente = res.getIdUtente()
            let contatti = res.getContatti()
            
            
            
            
            let rubrica = Rubrica(id: id, idUtente: idUtente, contatti: contatti)
            
            
            finished(rubrica)
        }
    }
    
    func ottieniRubricaDaIdUtente(idUtenteDaCercare: String, finished: @escaping([Rubrica]?) -> Void) {
        
        rubricaDB.ottieniRubricaDaIdUtente(idUtenteDaCercare: idUtenteDaCercare){(rubriche) in
            
            guard let rubricheRes = rubriche else {
                print("error")
                return
            }
            let rubricheArr = rubricheRes.map{(res) ->Rubrica in
                
                let id = res.getId()
                let idUtente = res.getIdUtente()
                let contatti = res.getContatti()
                
                
                let rubrica = Rubrica(id: id, idUtente: idUtente, contatti: contatti)
                
                return rubrica
                
            }
            finished(rubricheArr)
        }
    }
}
