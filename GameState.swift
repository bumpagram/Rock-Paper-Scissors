//
//  GameState.swift
//  Rock Paper Scissors
//
//  Created by Denis Azarkov on 30.04.23.
//

import Foundation

enum GameState {
    case Start
    case Win
    case Lose
    case Draw
    var setTheStatus: String {  // исчисляемое свойство для нижнего лейбла с сообщениями (статус игры)
        switch self {
        case .Start : return "Rock, Paper, Scissors?"
        case .Win : return "You Won!"
        case .Lose : return "You Lose :( "
        case .Draw : return "Holy Hell, It's a Draw!"
        }
    }
    
    var setOpponentSign: String {  // исчисляемое свойство только для старта по сути, чтобы иконка рисовалась
        switch self {
        case .Start : return "🤖"
        default : return ""
        }
    }
    
    
    
}
