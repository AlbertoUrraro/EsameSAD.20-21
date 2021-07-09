//
//  ContattoDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 27/06/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ContattoDB{
    
    //Dichiarazione variabili
    var id: String = ""
    var nome: String  = ""
    var numero: String = ""
    var numeroEmergenza: Bool = false
    
    
    let db = DBManager.shared.db
    
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
    
    func ottieniContattoDaId(idDaCercare: String, finished: @escaping([ContattoDB]?) -> Void) {
        db!.collection("contatto").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let contatti = result.map{ (queryResult) -> ContattoDB in
                let data = result
                
                let id = idDaCercare
                let nome = data["nome"] as? String ?? ""
                let numero = data["numero"] as? String ?? ""
                let numeroEmergenza = data["numeroEmergenza"] as? Bool ?? false
                
                
                
                let contatto = ContattoDB(id: id, nome: nome, numero: numero,numeroEmergenza: numeroEmergenza)
                
                return contatto
                
            }
            finished(contatti)
        }
    }
    
}
