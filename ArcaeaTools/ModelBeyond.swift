//
//  ModelBeyond.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation


func Progress(playrating:String, partnerover:String, fragmentBoost:String, beyondBoost:String, memoryBoost:Bool, progress:String) -> String{
    var dblmemoryboost:Double
    var dblprogress = Double(progress) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblpartnerover = Double(partnerover) ?? 0.0
    var dblfragmentboost = Double(fragmentBoost) ?? 0.0
    var dblbeyondboost = Double(beyondBoost) ?? 0.0
    if memoryBoost == true{
        dblmemoryboost = 3.0
    }else{
        dblmemoryboost = 1.0
    }
    if dblmemoryboost != 0 && dblprogress != 0 && dblplayrating != 0 && dblpartnerover != 0 && dblfragmentboost != 0 && dblbeyondboost != 0{
        dblprogress =  sqrt(dblplayrating)*7*0.125*(dblpartnerover/50)*dblmemoryboost*dblfragmentboost*dblbeyondboost
        
    }
        return String(dblprogress)
        
    
}

func Partnerover(playrating:String, partnerover:String, fragmentBoost:String, beyondBoost:String, memoryBoost:Bool, progress:String ) -> String{
    var dblmemoryboost:Double
    var dblprogress = Double(progress) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblpartnerover = Double(partnerover) ?? 0.0
    var dblfragmentboost = Double(fragmentBoost) ?? 0.0
    var dblbeyondboost = Double(beyondBoost) ?? 0.0
    if memoryBoost == true{
        dblmemoryboost = 3.0
    }else{
        dblmemoryboost = 1.0
    }
    
    if dblmemoryboost != 0 && dblprogress != 0 && dblplayrating != 0 && dblpartnerover != 0 && dblfragmentboost != 0 && dblbeyondboost != 0{
        dblpartnerover = (dblprogress/(sqrt(dblplayrating)*7*0.125*dblmemoryboost*dblfragmentboost*dblbeyondboost))*50
    }
            return String(dblpartnerover)
    
}

