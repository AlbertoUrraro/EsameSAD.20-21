//
//  ProgressBar.swift
//  AppEsame
//
//  Created by Anna on 07/07/2021.
//

import Foundation
import UIKit

class ProgressBar{
    
    var progress: Int!
    
    
    func setProgress(progress: Int){
        self.progress = progress
        UserDefaults.standard.set(self.progress, forKey: "progress" )
    }
    
    func getProgress()->Int{
        return UserDefaults.standard.integer(forKey: "progress")
    }
    
    func setProgressStartCura(progress: Int){
        self.progress = progress
        UserDefaults.standard.set(self.progress, forKey: "progressStartCura" )
    }
    
    func getProgressStartCura()->Int{
        return UserDefaults.standard.integer(forKey: "progressStartCura")
    }
    
    func setDate(data: Date){
        UserDefaults.standard.setValue(data, forKey: "dataAggiunta")
    }
    
    func getDate()->Date{
        return UserDefaults.standard.object(forKey: "dataAggiunta") as! Date
    }
}
