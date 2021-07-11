//
//  ParametriTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 19/05/2021.
//

import UIKit
import Combine
class ParametriTableViewCell: UITableViewCell {

  
    @IBOutlet weak var nomeParametro: UILabel!


    @IBOutlet weak var stepper: DSFStepperView!
    var cancellable: AnyCancellable?

    
    func initcell(valoreIniziale: CGFloat, valoreFinale: CGFloat,indexPathRow: Int){
        stepper.minimum = valoreIniziale
        stepper.maximum = valoreFinale
        DBManager.shared.stepperParametri.append(valoreIniziale)
        
    
    self.cancellable = stepper.publishedValue.sink(receiveValue: { currentValue in
//        c valore che salvo dinamicamente
       if let c = currentValue {
          print("stepper is currently at \(c) index \(indexPathRow)")
        DBManager.shared.stepperParametri[indexPathRow] = currentValue ?? 0
        
       }
       else {
          print("stepper is currently empty")
       }
    })
    }
    
    
   
}
