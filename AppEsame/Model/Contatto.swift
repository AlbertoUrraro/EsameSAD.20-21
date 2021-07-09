//
//  Contatto.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation

class Contatto{
    
    //Dichiarazione variabili
    var id: String = ""
    var nome: String  = ""
    var numero: String = ""
    var numeroEmergenza: Bool = false
    
    let contattoDB = ContattoDB()
    
    //Costruttore
    init(id: String, nome: String, numero: String, numeroEmergenza: Bool){
        self.id = id
        self.nome = nome
        self.numero = numero
        self.numeroEmergenza = numeroEmergenza
    }
    
    //Costruttore vuoto
    init(){}
    
    //Funzioni set
    func setId(id: String){self.id = id}
    func setNome(nome: String){self.nome = nome}
    func setNumero(numero: String){self.numero = numero}
    func setNumeroEmergenza(numeroEmergenza: Bool){self.numeroEmergenza = numeroEmergenza}
    
    
    //Funzioni get
    func getId()->String{return self.id}
    func getNome()->String{return self.nome}
    func getNumero()->String{return self.numero}
    func getNumeroEmergenza()->Bool{return self.numeroEmergenza}
    
    func ottieniContattoDaId(idDaCercare: String, finished: @escaping(Contatto?) -> Void) {
        
        contattoDB.ottieniContattoDaId(idDaCercare: idDaCercare){(contatti) in
            
            guard let contattiRes = contatti else {
                print("error")
                return
            }
            let  res = contattiRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let nome = res.getNome()
            let numero = res.getNumero()
            let numeroEmergenza = res.getNumeroEmergenza()
            
            
            
            let contatto = Contatto(id: id, nome: nome, numero: numero, numeroEmergenza: numeroEmergenza)
            
            
            finished(contatto)
        }
    }
    
}
