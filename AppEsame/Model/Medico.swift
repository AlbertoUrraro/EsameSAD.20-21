//
//  Medico.swift
//  AppEsame
//
//  Created by Anna on 10/05/2021.
//

import Foundation

class Medico: Utente{
    //Dichiarazione variabili
    var specializzazioni: [String] = []
    
    //variabile entità DB
    var medicoDB = MedicoDB()
    
    //Costruttore
    init(id: String, uid: String,  nome: String, cognome: String, dataNascita: String, codiceFiscale: String, telefono: String, email: String, tipo: String,password: String, specializzazioni: [String], indirizzo: String, citta: String, cap: String) {
        self.specializzazioni = specializzazioni
        super.init(id: id, uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, indirizzo: indirizzo, citta: citta, cap: cap)
    }
    
    //Costruttore vuoto
    override init(){
        super.init()
    }
    
    //Funzione set
    func setSpecializzazioni(specializzazioni: [String]){self.specializzazioni = specializzazioni}
    
    //Funzione get
    func getSpecializzazioni()->[String]{return self.specializzazioni}
    
    
    func medicoEqUtente(utente:Utente){
        self.setId(id: utente.getId())
        self.setUid(id: utente.getUid())
        self.setNome(nome: utente.getNome())
        self.setCognome(cognome: utente.getCognome())
        self.setDataNascita(dataNascita: utente.getDataNascita())
        self.setCodiceFiscale(codiceFiscale: utente.getCodiceFiscale())
        self.setTelefono(telefono: utente.getTelefono())
        self.setEmail(email: utente.getEmail())
        self.setTipo(tipo: utente.getTipo())
        self.setPassword(password: utente.getPassword())
        self.setIndirizzo(indirizzo: getIndirizzo())
        self.setCitta(citta: getCitta())
        self.setCap(cap: getCap())
    }
    
    
    func creaMedico(medico: Medico)->String{
        
        let medicoDb = MedicoDB(id: medico.getId(), uid: medico.getUid(), nome: medico.getNome(), cognome: medico.getCognome(), dataNascita: medico.getDataNascita(), codiceFiscale: medico.getCodiceFiscale(), telefono: medico.getTelefono(), email: medico.getEmail(), tipo: medico.getTipo(), password: medico.getPassword(), specializzazioni: medico.getSpecializzazioni(), indirizzo: medico.getIndirizzo(), citta: medico.getCitta(), cap: medico.getCap())
       
        let idMedico = medicoDB.creaMedico(medicoDb: medicoDb)
        
        return idMedico
    }
    
    func ottieniMedicoDaEmail(emailDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        
        medicoDB.ottieniMedicoDaEmail(emailDaCercare: emailDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            let mediciArr = mediciRes.map{(res) ->Medico in
                
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
                let specializzazioni = res.getSpecializzazioni()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                
                let medico = Medico(id: id, uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    func ottieniMedicoDaId(idDaCercare: String, finished: @escaping(Medico?) -> Void) {
        
        medicoDB.ottieniMedicoDaId(idDaCercare: idDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            
            let  res = mediciRes[0] //Ottengo sempre un risultato unico perchè l'id è univoco
            let id = res.id
            let uid = res.getUid()
            let nome = res.getNome()
            let cognome = res.getCognome()
            let dataNascita = res.getDataNascita()
            let codiceFiscale = res.getCodiceFiscale()
            let telefono = res.getTelefono()
            let email = res.getEmail()
            let tipo = res.getTipo()
            let password = res.getPassword()
            let specializzazioni = res.getSpecializzazioni()
            let indirizzo = res.getIndirizzo()
            let citta = res.getCitta()
            let cap = res.getCap()
            
            
            
            
            let medico = Medico(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
            
            
            finished(medico)
        }
    }
    
    func ottieniTuttiMedici(finished: @escaping([Medico]?) -> Void) {
        
        
        medicoDB.ottieniTuttiMedici{(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            let mediciArr = mediciRes.map{(result) ->Medico in
                
                let id = result.getId()
                let uid = result.getUid()
                let nome = result.getNome()
                let cognome = result.getCognome()
                let dataNascita = result.getDataNascita()
                let codiceFiscale = result.getCodiceFiscale()
                let telefono = result.getTelefono()
                let email = result.getEmail()
                let tipo = result.getTipo()
                let password = result.getPassword()
                let specializzazioni = result.getSpecializzazioni()
                let indirizzo = result.getIndirizzo()
                let citta = result.getCitta()
                let cap = result.getCap()
                
                
                let medico = Medico(id: id,uid: uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    
    func ottieniMedicoDaUid(uidDaCercare: String, finished: @escaping([Medico]?) -> Void) {
        
        medicoDB.ottieniMedicoDaUid(uidDaCercare: uidDaCercare){(medici) in
            
            guard let mediciRes = medici else {
                print("error")
                return
            }
            let mediciArr = mediciRes.map{(res) ->Medico in
                
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
                let specializzazioni = res.getSpecializzazioni()
                let indirizzo = res.getIndirizzo()
                let citta = res.getCitta()
                let cap = res.getCap()
                
                
                
                let medico = Medico(id: id, uid:uid, nome: nome, cognome: cognome, dataNascita: dataNascita, codiceFiscale: codiceFiscale, telefono: telefono, email: email, tipo: tipo, password: password, specializzazioni: specializzazioni, indirizzo: indirizzo, citta: citta, cap: cap)
                
                return medico
                
            }
            finished(mediciArr)
        }
    }
    
    func creaTerapiaFarmacologica(terapiaFarmacologica: TerapiaFarmacologica)->String{
        
        let terapiaFarmacologicaDb = TerapiaFarmacologicaDB(id: terapiaFarmacologica.getId(), istruzioni: terapiaFarmacologica.getIstruzioni(), ricetta: terapiaFarmacologica.getRicetta(), farmaci: terapiaFarmacologica.getFarmaci(), intervalloOrario: terapiaFarmacologica.getIntervalloOrario())
        
        let  idTerapiaFarmacologica = medicoDB.creaTerapiaFarmacologica(terapiaFarmacologicaDb: terapiaFarmacologicaDb)
        return idTerapiaFarmacologica
    }
    
    func ottieniRichiesteDaIdMedico(idDaCercare: String,condizione: Bool, finished: @escaping([Richiesta]?) -> Void) {
        
        medicoDB.ottieniRichiesteDaIdMedico(idDaCercare: idDaCercare, condizione: condizione){(richieste) in
            
            guard let richiesteRes = richieste else {
                print("error")
                return
            }
            let richiesteArr = richiesteRes.map{(result) ->Richiesta in
                
                let id = result.getId()
                let idPaziente = result.getIdPaziente()
                let idMedico  = result.getIdMedico()
                let stato = result.getStato()
                
                
                
                let richiesta = Richiesta(id: id, idPaziente: idPaziente, idMedico: idMedico, stato: stato)
                
                return richiesta
                
            }
            finished(richiesteArr)
        }
    }
    
}
