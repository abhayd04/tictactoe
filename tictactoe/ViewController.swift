//
//  ViewController.swift
//  tictactoelocal
//
//  Created by Abhay Dixit on 04/08/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bu9: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buselectEvent(_ sender: Any) {
        let buselect = sender as! UIButton
        playgame(buselect:buselect)
    }
    var activeplayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playgame(buselect:UIButton){
        if activeplayer == 1{
            buselect.setTitle("X", for:UIControl.State.normal)
            buselect.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.5)
            player1.append(buselect.tag)
            activeplayer = 2
            Autoplay()
        }
        else{
            buselect.setTitle("O", for: UIControl.State.normal)
            buselect.backgroundColor = UIColor(red: 32/255, green: 193/255, blue: 243/255, alpha: 0.5)
            player2.append(buselect.tag)
            activeplayer = 1
        }
        buselect.isEnabled = false
        findwinner()
    }
    func findwinner(){
        var winner = -1
        //row1
        if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
            winner = 1
        }
        if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
            winner = 2
        }
        //row2
        if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
            winner = 1
        }
        if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
            winner = 2
        }
        //row3
        if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
            winner = 1
        }
        if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
            winner = 2
        }
        //col1
        if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
            winner = 1
        }
        if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
            winner = 2
        }
        //col2
        if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
            winner = 1
        }
        if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
            winner = 2
        }
        //col3
        if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
            winner = 1
        }
        if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
            winner = 2
        }
        //diag1
        if(player1.contains(1) && player1.contains(5) && player1.contains(9)){
            winner = 1
        }
        if(player2.contains(1) && player2.contains(5) && player2.contains(9)){
            winner = 2
        }
        //diag2
        if(player1.contains(3) && player1.contains(5) && player1.contains(7)){
            winner = 1
        }
        if(player2.contains(3) && player2.contains(5) && player2.contains(7)){
            winner = 2
        }
        if winner != -1{
            var msg = " "
            if winner == 1{
                msg = "player 1 is winner"
            }
            else {
                msg = "player 2 is winner"
            }
            //print(msg)
            let alert = UIAlertController(title: "winner", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default,handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func Autoplay(){
        //scan empty cells
        var emptyCells = [Int]()
        for index in 1...9 {
            if !(player1.contains(index)||player2.contains(index)){
                emptyCells.append(index)
            }
        }
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellId = emptyCells[Int(randIndex)]
        var buselect:UIButton?
        switch cellId {
        case 1:
            buselect = bu1
        case 2:
            buselect = bu2
        case 3:
            buselect = bu3
        case 4:
            buselect = bu4
        case 5:
            buselect = bu5
        case 6:
            buselect = bu6
        case 7:
            buselect = bu7
        case 8:
            buselect = bu8
        case 9:
            buselect = bu9
        default:
            buselect = bu1
        }
        playgame(buselect: buselect!)
    }
    
}

