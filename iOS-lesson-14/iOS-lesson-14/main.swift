//
//  main.swift
//  iOS-lesson-14
//
//  Created by Amina on 4/27/21.
//

protocol AdvancedLifeSupport {
    func performCPR()
}

class Handler {
    var delegate: AdvancedLifeSupport
    
    func assess() {
        print("?")
    }
    
    func emergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: Handler) {
        handler.delegate = self
    }
    func performCPR() {
        print("Chest compr")
    }
}



let emilio = Handler()
let pete = Paramedic()

emilio.assess()
emilio.emergency()

