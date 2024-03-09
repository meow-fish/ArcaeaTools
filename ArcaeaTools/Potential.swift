//
//  Potential.swift
//  ArcaeaTools
//
//  Created by Darren Li on 28/1/2024.
//

import Foundation
import Darwin

//func PlayRating(Score:ModelPlayRating, Constant:Double) -> Double{
    //var playRating:Double
        //if Score >= 10000000{
            //playRating = Constant + 2.0
        //} else if Score >= 9800000{
            //playRating = Constant+1.0+((Score-9800000.0)/200000.0)
        //} else {
            //playRating = Constant+((Score-9500000.0)/300000.0)
        //}
    //return playRating
//}

func FindTargetScore(Constant:Double, TargetPlayRating:Double) -> Double{
    /*var constant = Constant
    var targetplayrating = TargetPlayRating
    var playrating:Double
    var target = 0.0
    if constant - targetplayrating < 2{
        for i in 9500000...10000001{
            playrating = PlayRating(Score: Double(i), Constant: constant)
                if playrating > targetplayrating{
                    target = Double(i)
                    break
                }
                var i = i + 1
            }
        }
        return target*/
    return 1.1
    }


