//
//  ModelWorld.swift
//  ArcaeaTools
//
//  Created by Darren Li on 25/3/2024.
//

import Foundation

func Step (playrating:String, partnerstep:String, staminaboost:String, fragmentboost:String, memoryboost:Bool, step:String) -> String{
    var dblmemoryboost:Double
    var dblstep = Double(step) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblpartnerstep = Double(partnerstep) ?? 0.0
    var dblfragmentboost = Double(fragmentboost) ?? 0.0
    var dblstaminaboost = Double(staminaboost) ?? 0.0
    if memoryboost == true{
        dblmemoryboost = 4.0
    }else{
        dblmemoryboost = 1.0
    }
    if dblmemoryboost != 0  && dblplayrating != 0 && dblpartnerstep != 0 && dblfragmentboost != 0 && dblstaminaboost != 0 && dblstep != 0{
         dblstep = (2.5+sqrt(6*dblplayrating))*dblmemoryboost*dblfragmentboost*dblstaminaboost*dblpartnerstep/50
        
    }
    /*Boost = Boost*staminaBoost*fragmentBoost
    Step = 2.5+sqrt(6*PlayRating(Score: Score, Constant: Constant))
    Step = Step*(PartnerStep/50)*Boost */
    return String(dblstep)
}

func Partnerstep (playrating:String, partnerstep:String, staminaboost:String, fragmentboost:String, memoryboost:Bool, step:String) -> String{
    var dblmemoryboost:Double
    var dblstep = Double(step) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblpartnerstep = Double(partnerstep) ?? 0.0
    var dblfragmentboost = Double(fragmentboost) ?? 0.0
    var dblstaminaboost = Double(staminaboost) ?? 0.0
    if memoryboost == true{
        dblmemoryboost = 4.0
    }else{
        dblmemoryboost = 1.0
    }
    
    if dblmemoryboost != 0  && dblplayrating != 0 && dblpartnerstep != 0 && dblfragmentboost != 0 && dblstaminaboost != 0 && dblstep != 0{
         dblpartnerstep = dblstep/(2.5+sqrt(6*dblplayrating)*dblmemoryboost*dblfragmentboost*dblstaminaboost)*50
        
    }

    return String(dblpartnerstep)
}
