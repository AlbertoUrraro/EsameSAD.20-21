//
//  ParametroVitaleDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 10/07/21.
//


import Foundation
import FirebaseCore
import FirebaseFirestore


class ParametroVitaleDB{
    
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
    
    let db = DBManager.shared.db
    
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
    
    
    func creaParametroVitale(parametroVitaleDb: ParametroVitaleDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("parametroVitale").addDocument(data: [
            "nome": parametroVitaleDb.getNome(),
            "valore": parametroVitaleDb.getValore(),
            "sogliaMinima": parametroVitaleDb.getSogliaMinima(),
            "sogliaMassima": parametroVitaleDb.getSogliaMassima(),
            "data": parametroVitaleDb.getData(),
            "ora": parametroVitaleDb.getOra(),
            "emergenza": parametroVitaleDb.getEmergenza(),
            "priorita": parametroVitaleDb.getPriorita(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
    func ottieniParametroVitaleDaId(idDaCercare: String, finished: @escaping([ParametroVitaleDB]?) -> Void) {
        db!.collection("parametroVitale").document(idDaCercare).getDocument { (queryResult, err) in
            guard let result = queryResult?.data() else {
                print("No documents")
                return
            }
            
            let parametriVitali = result.map{ (queryResult) -> ParametroVitaleDB in
                let data = result
                
                let id = idDaCercare
                let nome = data["nome"] as? String ?? ""
                let valore = data["valore"] as? Float ?? 0
                let sogliaMinima = data["sogliaMinima"] as? Float ?? 0
                let sogliaMassima = data["sogliaMassima"] as? Float ?? 0
                let data_ = data["data"] as? String ?? ""
                let ora = data["ora"] as? String ?? ""
                let emergenza = data["emergenza"] as? Bool ?? false
                let priorita = data["priorita"] as? Int ?? 0
                
                
                let parametroVitale = ParametroVitaleDB(id: id, nome: nome, valore: valore, sogliaMinima: sogliaMinima, sogliaMassima: sogliaMassima, data: data_, ora: ora, emergenza: emergenza, priorita: priorita)
                
                return parametroVitale
                
            }
            finished(parametriVitali)
        }
    }
}
