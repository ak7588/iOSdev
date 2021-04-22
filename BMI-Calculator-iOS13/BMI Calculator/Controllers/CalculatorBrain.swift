//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Amina on 4/22/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Just right!", color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Watch your diet", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
    }
}

/*
 
 OPTIONALS
 
 let myOpt: String?
 
 myOpt = "Amina"
 myOpt = nil

 1.
 
 if (myOpt != nil) {
    let text: String = myOpt!
 } else {
    print("Nil value.")
 }
 
 2.
 
 if let safeOpt = myOpt {
    let text: String = safeOpt
 }
 
 3.
 
 let text: String = myOpt ?? "I am default"
 
 
 
 */
