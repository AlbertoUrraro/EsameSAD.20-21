//
//  RichiestaDB.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 28/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class RichiestaDB{
    
    
    //Dichiarazione variabili
    var id: String = ""
    var idPaziente: String = ""
    var idMedico: String = ""
    var stato: Bool = false
    
    
    let db = DBManager.shared.db
    
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
    
    
    func creaRichiesta(richiestaDb: RichiestaDB){
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db!.collection("richiesta").addDocument(data: [
            "idPaziente": richiestaDb.getIdPaziente(),
            "idMedico": richiestaDb.getIdMedico(),
            "stato": richiestaDb.getStato(),
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
   
    
    func aggiornaStatoRichiesta(idRichiesta: String, stato: Bool){
        let richiesta = db!.collection("richiesta").document(idRichiesta)

        // Set the "capital" field of the city 'DC'
        richiesta.updateData([
            "stato": stato
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
}
