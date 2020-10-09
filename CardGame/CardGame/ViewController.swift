import UIKit

class ViewController: UIViewController {

    let cardImages = ["2C","3C","4C","5C","6C","7C","8C","9C","10C","JC","QC","KC","AC",
                      "2D","3D","4D","5D","6D","7D","8D","9D","10D","JD","QD","KD","AD",
                      "2H","3H","4H","5H","6H","7H","8H","9H","10H","JH","QH","KH","AH",
                      "2S","3S","4S","5S","6S","7S","8S","9S","10S","JS","QS","KS","AS"]
    var randomArr: [Int] = []
    var reset = false

    
    @IBOutlet weak var player1Card1: UIImageView!
    @IBOutlet weak var player1Card2: UIImageView!
    @IBOutlet weak var player1Card3: UIImageView!
    @IBOutlet weak var player2Card1: UIImageView!
    @IBOutlet weak var player2Card2: UIImageView!
    @IBOutlet weak var player2Card3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initial()
    }
    
    func initial() {
        let player1Cards: [UIImageView] = [player1Card1, player1Card2, player1Card3]
        let player2Cards: [UIImageView] = [player2Card1, player2Card2, player2Card3]
        for card in player1Cards {
            card.image = UIImage(named: "blue_back")
        }
        for card in player2Cards {
            card.image = UIImage(named: "red_back")
        }
        randomArr = []
        lblWinner.text = " "
        reset = false
        playButton.setTitle("Play!", for: .normal)
    }
    
    @IBAction func play(_ sender: UIButton) {
        if(reset) {
            let alertController = UIAlertController(title: "Play again?", message:"", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: alertHandler))
            alertController.addAction(UIAlertAction(title: "No", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }else {
            randonGenerator()
            let playerCards: [UIImageView] = [player1Card1, player1Card2, player1Card3, player2Card1, player2Card2, player2Card3]
            var cardIndex = 0
            while (cardIndex < 6) {
                playerCards[cardIndex].image = UIImage(named: cardImages[randomArr[cardIndex]])
                if(cardImages[randomArr[cardIndex]] == "AS" && cardIndex < 3) {
                    lblWinner.text = "Winner: Player 1"
                }else if(cardImages[randomArr[cardIndex]] == "AS" && cardIndex >= 3) {
                    lblWinner.text = "Winner: Player 2"
                }
                cardIndex += 1
            }
            if(lblWinner.text == " ") {
                lblWinner.text = "Draw"
            }
            playButton.setTitle("Play Again?", for: .normal)
            reset = true
        }
    }
    
    func alertHandler(alert: UIAlertAction!) {
        initial()
    }
    
    func randonGenerator() {
        while(randomArr.count < 6) {
            let tempRandomNum = Int.random(in: 0..<52)
            if(!randomArr.contains(tempRandomNum)) {
                randomArr.append(tempRandomNum)
            }
        }
    }
}

