//
//  Sign.swift
//  Rock Paper Scissors
//
//  Created by Denis Azarkov on 30.04.23.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {  // исчисляемое свойство для вывода значков на экран потом
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors : return "✌️"
        }
    }
    
    func compareValues(oppontentsTurn: Sign)-> GameState {  // сравнение результатов игры.
        //  Возвращает статус победа/поражение/ничья
        switch self {
            
        case .rock:
            switch oppontentsTurn {
            case .rock : return GameState.Draw
            case .paper : return GameState.Lose
            case .scissors : return GameState.Win
            }
    
        case .paper:
            switch oppontentsTurn {
            case .rock: return GameState.Win
            case .paper: return GameState.Draw
            case .scissors: return GameState.Lose
            }
            
        case .scissors:
            switch oppontentsTurn {
            case .rock: return GameState.Lose
            case .paper: return GameState.Win
            case .scissors : return GameState.Draw
            }
        }
    }
}

func randomSign() -> Sign {  // для оппонента. генерирует случайное число и возвращает экземпляр
    let gotRandom = Int.random(in: 0...2)
    if gotRandom == 0  { return .rock}
    else if gotRandom == 1 { return .paper}
    else { return .scissors}
}
