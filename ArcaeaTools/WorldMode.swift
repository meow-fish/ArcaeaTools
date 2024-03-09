//
//  WorldMode.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/1/2024.
//

import Foundation
import Darwin

func stepWorld (Score:Double, Constant:Double, PartnerStep:Double, staminaBoost:Double, fragmentBoost:Double, memoryBoost:Bool) -> Double{
    var Step = 0.0
    var Boost = 1.0
    if memoryBoost == true{
        Boost = 4.0
    }
    Boost = Boost*staminaBoost*fragmentBoost
    Step = 2.5+sqrt(6*PlayRating(Score: Score, Constant: Constant))
    Step = Step*(PartnerStep/50)*Boost
    return Step
}

func stepBeyond (Score:Double, Constant:Double, PartnerOver:Double, fragmentBoost:Double, memoryBoost:Bool, beyondBoost:Double) -> Double{
    var Step = 0.0
    var Boost = 1.0
    let Progression:Double

    if memoryBoost == true{
        Boost = 4.0
    }
    
    Boost = Boost*fragmentBoost*beyondBoost
    Progression = sqrt(PlayRating(Score: Score, Constant: Constant))*7*0.125*(PartnerOver/50)*Boost
    return Progression
}

func stepWorldRoundStamina (Score:Double, Constant:Double, PartnerStep:Double, staminaBoost:Double,Length:Double, fragmentBoost:Double, memoryBoost:Bool, Legacy:Bool, getStamina:Bool, getRound:Bool) -> Double{
    var Step = stepWorld (Score:Score, Constant:Constant, PartnerStep:PartnerStep, staminaBoost:staminaBoost, fragmentBoost:fragmentBoost, memoryBoost:memoryBoost)
    var StaminaCost:Double
    var Round = Length/Step
    switch Legacy{
    case true:
        StaminaCost = Round*staminaBoost
    case false:
        StaminaCost = Round*2
    }
    if getStamina{
        return StaminaCost
    }else{
        return Round
    }
    
}
