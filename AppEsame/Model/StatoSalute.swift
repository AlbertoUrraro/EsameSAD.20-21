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
    
    
    
    
    func ottieniPazienteDaId(idDaCercare: String, finished: @escaping(Paziente?) -> Void) {
        
        statoSaluteDB.ottieniPazienteDaId(idDaCercare: idDaCercare){(pazienti) in
            
            guard let pazientiRes = pazienti else {
                print("error")
                return
            }
            let  res = pazientiRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = res.getId()
            let uid = res.getUid()
            let nome = res.getNome()
            let cognome = res.getCognome()
            let dataNascita = res.getDataNascita()
            let codiceFiscale = res.getCodiceFiscale()
            let telefono = res.getTelefono()
            let email = res.getEmail()
            let tipo = res.getTipo()
            let password = res.getPassword()
            let allergie = res.getAllergie()
            let patologie = res.getPatologie()
            let indirizzo = res.getIndirizzo()
            let citta = res.getCitta()
            let cap = res.getCap()
            
            
            
            let paziente = Paziente(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, allergie: allergie, patologie: patologie, indirizzo: indirizzo, citta: citta, cap: cap)
            
            
            //            }
            finished(paziente)
        }
    }
    
    func ottieniParametroVitaleDaId(idDaCercare: String, finished: @escaping(ParametroVitale?) -> Void) {
        
        statoSaluteDB.ottieniParametroVitaleDaId(idDaCercare: idDaCercare){(parametriVitali) in
            
            guard let parametriVitaliRes = parametriVitali else {
                print("error")
                return
            }
            let  res = parametriVitaliRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = idDaCercare
            let nome = res.getNome()
            let valore = res.getValore()
            let sogliaMinima = res.getSogliaMinima()
            let sogliaMassima = res.getSogliaMassima()
            let data = res.getData()
            let ora = res.getOra()
            let emergenza = res.getEmergenza()
            let priorita = res.getPriorita()
            
            
            let parametroVitale = ParametroVitale(id: id, nome: nome, valore: valore, sogliaMinima: sogliaMinima, sogliaMassima: sogliaMassima, data: data, ora: ora, emergenza: emergenza, priorita:  priorita)
            
            
            finished(parametroVitale)
        }
    }
    
    func ottieniTuttiSintomi(finished: @escaping([Sintomo]?) -> Void) {
        
        
        statoSaluteDB.ottieniTuttiSintomi{(sintomi) in
            
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
    
    func ottieniTutteAllergie(finished: @escaping([Allergia]?) -> Void) {
        
        
        statoSaluteDB.ottieniTutteAllergie{(allergie) in
            
            guard let allergieRes = allergie else {
                print("error")
                return
            }
            let allergieArr = allergieRes.map{(result) ->Allergia in
                
                let id = result.getId()
                let titolo = result.getTitolo()
                
                
                let allergia = Allergia(id: id, titolo: titolo)
                
                return allergia
                
            }
            finished(allergieArr)
        }
    }
    
    
}
