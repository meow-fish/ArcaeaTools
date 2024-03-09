//
//  ModelPlayRating.swift
//  ArcaeaTools
//
//  Created by Darren Li on 21/3/2024.
//

import Foundation
import Darwin

func Playrating(score:String, constant:String, playrating:String) -> String{
    var dblconstant = Double(constant) ?? 0.0
    var dblscore = Double(score) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    usleep(500)
    if dblscore != 0 && dblconstant != 0 && dblplayrating != 0{
        if dblscore >= 10000000{
              return String(dblconstant + 2.0)
        } else if dblscore >= 9800000{
            return String(dblconstant+1.0+((dblscore-9800000.0)/200000.0))
        } else {
            return  String(dblconstant+((dblscore-9500000.0)/300000.0))
        }
    }
    return playrating
    }

func Constant(score:String, playrating:String, constant:String) -> String{
    var dblscore = Double(score) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblconstant = Double(constant) ?? 0.0
    usleep(500)
    if dblscore != 0 && dblconstant != 0 && dblplayrating != 0{
            if dblscore >= 10000000{
               return  String(dblplayrating - 2.0)
            } else if dblscore >= 9800000{
                return  String(dblplayrating-1.0-((dblscore-9800000.0)/200000.0))
            } else{
                return  String(dblplayrating-((dblscore-9500000.0)/300000.0))
            }
        }
    return constant
    }

func Score(constant:String, playrating:String, score:String) -> String{
    var dblconstant = Double(constant) ?? 0.0
    var dblplayrating = Double(playrating) ?? 0.0
    var dblscore = Double(score) ?? 0.0
    usleep(500)
    if dblscore != 0 && dblconstant != 0 && dblplayrating != 0{
        if dblplayrating >= dblconstant+2.0{
            return  String(10000000)
        } else if dblplayrating >= dblconstant+1.0{
            return  String((dblplayrating-dblconstant)*200000.0+9800000.0)
        } else{
            return String((dblplayrating-dblconstant)*300000.0+9500000.0)
        }
    }
    return score
    }

