//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Denis Azarkov on 30.04.23.
//

import UIKit
var currentGameStatus = GameState.Start
var opponentGenerated = Sign.paper   // пришлось присвоить рандомное значение, чтобы обойти проблему инициализаторов в классе VC.  на define Sign ругается, не пропускает

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBOutlet weak var topmostLabel: UILabel!
    @IBOutlet weak var statusgameLabel: UILabel!
    @IBOutlet weak var rockLabel: UIButton!
    @IBOutlet weak var paperLabel: UIButton!
    @IBOutlet weak var scissorsLabel: UIButton!
    @IBOutlet weak var playagainLabel: UIButton!  
    
    @IBAction func playagainPressed(_ sender: UIButton) {
        currentGameStatus = .Start
        updateUI()
    }
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        rockLabel.isHidden = false
        paperLabel.isHidden = true
        scissorsLabel.isHidden = true
        playMethod(playerChosen: Sign.rock)
    }
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        rockLabel.isHidden = true
        paperLabel.isHidden = false
        scissorsLabel.isHidden = true
        playMethod(playerChosen: Sign.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        rockLabel.isHidden = true
        paperLabel.isHidden = true
        scissorsLabel.isHidden = false
        playMethod(playerChosen: Sign.scissors)
    }
    
    @IBOutlet var mainview: UIView!
    
    
    func updateUI() {
        // СМОГ УБРАТЬ 4 ЖЕЛТЫХ ПРЕДУПРЕЖДЕНИЯ ПРО ФОРМЫ И КОНСТРЕИНТЫ, НО ВСЕ РАВНО ФОРМА ПЛЫВЕТ ПРИ AUTOLAYOUT,  UISTACKVIEW мб потом прикрутить // 
        
        if currentGameStatus == .Start {
            mainview.backgroundColor = .darkGray
            topmostLabel.text = GameState.Start.setOpponentSign
            statusgameLabel.text = GameState.Start.setTheStatus
            playagainLabel.isHidden = true
            rockLabel.isEnabled = true
            rockLabel.isHidden = false
            paperLabel.isEnabled = true
            paperLabel.isHidden = false
            scissorsLabel.isEnabled = true
            scissorsLabel.isHidden = false
        }
        
        if currentGameStatus == .Win {
            mainview.backgroundColor = .systemGreen
            topmostLabel.text = opponentGenerated.emoji
            statusgameLabel.text = GameState.Win.setTheStatus
            rockLabel.isEnabled = false
            paperLabel.isEnabled = false
            scissorsLabel.isEnabled = false
            playagainLabel.isHidden = false
        }
        
        if currentGameStatus == .Lose {
            mainview.backgroundColor = .systemMint
            topmostLabel.text = opponentGenerated.emoji
            statusgameLabel.text = GameState.Lose.setTheStatus
            rockLabel.isEnabled = false
            paperLabel.isEnabled = false
            scissorsLabel.isEnabled = false
            playagainLabel.isHidden = false
        }
        
        if currentGameStatus == .Draw {
            mainview.backgroundColor = .systemYellow
            topmostLabel.text = opponentGenerated.emoji
            statusgameLabel.text = GameState.Draw.setTheStatus
            rockLabel.isEnabled = false
            paperLabel.isEnabled = false
            scissorsLabel.isEnabled = false
            playagainLabel.isHidden = false
        }
            
    }
    
    func playMethod(playerChosen: Sign) {  // на входе символ игрока, а внутри генерируется ИИ
         opponentGenerated = randomSign()
        // сравнили символ игрока с сгенерированным ИИ оппонентом. изменили игровой статус, положили в глобал
        currentGameStatus = playerChosen.compareValues(oppontentsTurn: opponentGenerated)
        updateUI()
    }
    
    
    
}

