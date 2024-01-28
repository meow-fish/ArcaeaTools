//
//  WorldMode.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/1/2024.
//

import Foundation
import Darwin

func stepWorld (Score:Double, Constant:Double, PartnerStep:Double, Magnification:Double) -> Double{
    let Step:Double
    Step = 2.5+sqrt(6*PlayRating(Score: Score, Constant: Constant))*(PartnerStep/50)*Magnification
    return Step
}
