//
//  RegistrazioneTest.swift
//  AppEsameTests
//
//  Created by Anna on 02/09/2021.
//

import XCTest
@testable import AppEsame

class RegistrazioneTest: XCTestCase {
    var registrazione: RegistrazioneViewModel!
    var errore: Errore!
    override func setUp() {
        super.setUp()
        registrazione = RegistrazioneViewModel()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testvalidaStep1Registrazione(){
        errore =  RegistrazioneViewModel.validaStep1Registrazione(nome: "", cognome: "Rossi", codiceFiscale: "0123", telefono: "12345", email: "marco.rossi@gmail.com", password: "12345", ripetiPasword: "12345")
        XCTAssert(errore.errore) //Il test è superato se qualche campo è vuoto, questo perchè errore è true se c'è un errore
                                //Se volessi superare il test quando tutti i campi sono pieni dovrei mettere il !errore.errore
        
    }

  

}
