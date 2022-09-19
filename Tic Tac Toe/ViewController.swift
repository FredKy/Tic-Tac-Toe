//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Fredrik Kypta on 2022-09-19.
//

import UIKit

class ViewController: UIViewController {
    
    var playerTurn: String = "X"

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = "X"
    var currentTurn = "X"
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    
    func initialize() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardAction(_ sender: UIButton) {
        addToBoard(sender)
        
        print(boardIsFull())
        if (boardIsFull()) {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in self.resetBoard()}))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for btn in board {
            btn.setTitle(nil, for: .normal)
        }
    }
    
    func boardIsFull() -> Bool {
        for btn in board {
            if (btn.title(for: .normal) == nil) {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (currentTurn == "O") {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = "X"
                turnLabel.text = "Player 1"
            }
            
            else if (currentTurn == "X") {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = "O"
                turnLabel.text = "Player 2"
            }
        }
    }
    
}

