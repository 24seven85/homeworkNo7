//
//  main.swift
//  homeworkNo7
//
//  Created by Maksim Kjaulakis on 17.01.2021.
//

import Foundation

enum CardError: Error {
    case outOfMoney
    case overCardLimit
}
enum TerminalError: Error {
    case outOfBalance
    case overMaxCashOut
    case lessMinCashout
    case overMaxDeposit
}
extension CardError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .outOfMoney: return "Не хватает средств на карте"
        case .overCardLimit: return "Превышен лимит для снятия"
        }
    }
}

extension TerminalError: LocalizedError {
    public var errorDescription: String? {
        
        switch self {
        case .outOfBalance: return "В банкомате недостаточно средств"
        case .overMaxCashOut: return "Превышен лимит снятия банкомата"
        case .lessMinCashout: return "Слишком маленькая сумма"
        case .overMaxDeposit: return "Слишком большая сумма вклада"
        }
    }
}


struct Card {
    var balance: Double = 2000
    let cashOutLimit: Double = 300
    
}
class Terminal {
    var termBalance = 10000
    let maxCashOut = 5000
    let minCashOut = 10
    let maxDeposit = 1500


    func cashOut( amount: Double) -> CardError? {
        var card = Card()
        guard card.balance > amount else {
            return .outOfMoney
        }
        guard card.cashOutLimit >= amount else {
            return .overCardLimit
        }
        
        
        card.balance -= amount
        print("Со счета снято \(amount) $")
        return nil
    }
    
    func cashIn() {
        
    }
}



let terminal = Terminal()

if let error = terminal.cashOut(amount: 300) {
    print(error.localizedDescription)
   
}



