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
    case lessMinCashout
}
enum TerminalError: Error {
    case outOfBalance
    case overMaxDeposit
}
extension CardError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .outOfMoney: return "Не хватает средств на карте"
        case .overCardLimit: return "Превышен лимит для снятия"
        case .lessMinCashout: return "Слишком маленькая сумма для снятия"
        }
    }
}

extension TerminalError: LocalizedError {
    public var errorDescription: String? {
        
        switch self {
        case .outOfBalance: return "В банкомате недостаточно средств"
        case .overMaxDeposit: return "Слишком большая сумма вклада"
        }
    }
}


class Card {
    var balance: Double = 2000
    let cashOutLimit: Double = 300
    let cashoutMin: Double = 5
}
class Terminal {
    var termBalance: Double = 10000
    let maxDeposit: Double = 1500


    func cashOut( amount: Double) -> CardError? {
        var card = Card()
        
        guard card.balance > amount else {
            return .outOfMoney
        }
        guard card.cashOutLimit >= amount else {
            return .overCardLimit
        }
        guard card.cashoutMin <= amount else {
            return .lessMinCashout
        }
        
        
        card.balance -= amount
        terminal.termBalance -= amount
        print("Со счета снято \(amount) $")
        return nil
    }
    
    func cashIn(amount: Double) throws {
        var card = Card()
        var terminal = Terminal()
        guard terminal.maxDeposit >= amount else {
            throw TerminalError.overMaxDeposit
        }
        card.balance += amount
        print("Баланс счета увеличился на \(amount) $")
    }
}


let terminal = Terminal()

if let error = terminal.cashOut(amount: 5) {
    print(error.localizedDescription)

}


do {
    try terminal.cashIn(amount: 1600)
} catch let error {
    print(error.localizedDescription)
}

