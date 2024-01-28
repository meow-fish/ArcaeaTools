//
//  WorldMode.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/1/2024.
//

import Foundation
import Darwin

func stepWorld (Score:Double, Constant:Double, PartnerStep:Double, staminaBoost:Double, fragmentBoost:Double, memoryBoost:Double) -> Double{
    let Step:Double
    Step = 2.5+sqrt(6*PlayRating(Score: Score, Constant: Constant))*(PartnerStep/50)*staminaBoost*fragmentBoost*memoryBoost
    return Step
}

func stepBeyond (Score:Double, Constant:Double, PartnerOver:Double, fragmentBoost:Double, memoryBoost:Double, beyondBoost:Double) -> Double{
    let Progression:Double
    Progression = sqrt(PlayRating(Score: Score, Constant: Constant))*7*0.125*(PartnerOver/50)*fragmentBoost*memoryBoost*beyondBoost
    return Progression
}
