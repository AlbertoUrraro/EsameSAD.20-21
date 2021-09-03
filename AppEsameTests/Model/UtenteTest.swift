//
//  Utente.swift
//  AppEsameTests
//
//  Created by Anna on 02/09/2021.
//

import XCTest
@testable import AppEsame

class UtenteTest: XCTestCase {

    var utente: Utente!
    
    
    override func setUp() {
        super.setUp()
        utente = Utente(id: "01234", uid: "0245", nome: "Marco", cognome: "Rossi", dataNascita: "01/01/1970", codiceFiscale: "ABC123", telefono: "123456789", email: "marco.rossi@gmail.com", tipo: "Paziente", password: "marcorossi", indirizzo: "Via Milano 88", citta: "Napoli", cap: "80000")
    }

    override func tearDown() {
        super.tearDown()
}
    
    func testNome(){
        XCTAssertEqual(utente.nome, "Marco")
    }
    
    func testCap(){
        XCTAssertEqual(utente.cap,"80000")
    }
    
    
    
    
}
