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
    
    func testID(){
        XCTAssertEqual(utente.id, "01234")
    }
    
    func testuid(){
        XCTAssertEqual(utente.uid,"0245")
    }
    
    
    func testNome(){
        XCTAssertEqual(utente.nome, "Marco")
    }
    
    func testCognome(){
        XCTAssertEqual(utente.cognome, "Rossi")
    }
    
    func testDataNascita(){
        XCTAssertEqual(utente.dataNascita, "01/01/1970")
    }
    
    func testCF(){
        XCTAssertEqual(utente.codiceFiscale,"ABC123")
    }
    
    func testTelefono(){
        XCTAssertEqual(utente.telefono,"123456789")
    }
    
    func testEmail(){
        XCTAssertEqual(utente.email,"marco.rossi@gmail.com")
    }
    
    func testTipo(){
        XCTAssertEqual(utente.tipo,"Paziente")
    }
    
    func testPassword(){
        XCTAssertEqual(utente.password,"marcorossi")
    }
    func testIndirizzo(){
        XCTAssertEqual(utente.indirizzo,"Via Milano 88")
    }
    
    func testCitta(){
        XCTAssertEqual(utente.citta,"Napoli")
    }
  
    func testCap(){
        XCTAssertEqual(utente.cap,"80000")
    }
    
   
    
    
    
}
