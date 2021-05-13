//
//  DBManager.swift
//  AppEsame
//
//  Created by Carlo D'Avino on 13/05/21.
//

import Foundation
import FirebaseCore
import FirebaseFirestore


class DBManager{
    
    static let shared = DBManager()
    
    var db : Firestore?
    
    private init(){}
    
    public func openConnection(){
        self.db = Firestore.firestore()
    }
    
}
