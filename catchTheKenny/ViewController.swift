

import UIKit

class ViewController: UIViewController {

   var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView()]
    var hideTimer = Timer()
   var hScore = 0
    var number=0.0
    let pauseButton = UIButton(type: .system)
 
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var hScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // UIButton'u sistem tarzında başlatıyoruz
        pauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal) // "pause.fill" simgesini ekliyoruz
        pauseButton.tintColor = .black // Simgenin rengini ayarlayabilirsiniz
        pauseButton.frame = CGRect(x: 300, y: 90, width: 100, height: 100) // Butonun konumunu ve boyutunu ayarlayın
        pauseButton.addTarget(self, action: #selector(pauseButtonPressed), for: .touchUpInside) // Aksiyon ekliyoruz
        view.addSubview(pauseButton) // Butonu arayüze ekliyoruz
        pauseButton.isEnabled = false

        scoreLabel.text = "score: \(score)"
        // Do any additional setup after loading the view.
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        if  storedHighScore == nil {
            hScore = 0
            hScoreLabel.text = "High Score : \(hScore)"
        }
        if let newScore = storedHighScore as? Int {
            hScore = newScore
            hScoreLabel.text = "High Score : \(hScore)"
        }
        
        
        let recognizer1 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer2 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer3 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer4 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer5 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer6 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer7 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer8 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        let recognizer9 =  UITapGestureRecognizer(target: self, action: #selector(kennyClicked))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        kennyHide()
    }
    
    @objc func kennyHide() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[random].isHidden = false
    }
    
    @objc func kennyClicked(){
        score = score + 1
        scoreLabel.text = "score: \(score)"
    }

    @IBAction func startClicked(_ sender: Any) {
        pauseButton.isEnabled = true
        startButton.isEnabled = false
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        counter = 30
        timeLabel.text = "time : \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        switch number {
        case 1.5:
           
            hideTimer = Timer.scheduledTimer(timeInterval: number, target: self, selector: #selector(kennyHide), userInfo: nil, repeats: true)
        case 0.85:
            
            hideTimer = Timer.scheduledTimer(timeInterval: number, target: self, selector: #selector(kennyHide), userInfo: nil, repeats: true)
        case 0.40:
            
            hideTimer = Timer.scheduledTimer(timeInterval: number, target: self, selector: #selector(kennyHide), userInfo: nil, repeats: true)
        default: break
        }
        
    }
    @objc func countDown(){
        counter = counter - 1
        timeLabel.text = "time : \(counter)"
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            let alert = UIAlertController(title: "time's up !", message: "do you want to again ?", preferredStyle: UIAlertController.Style.alert)
            
            
            let okAction = UIAlertAction(title: "quit", style: UIAlertAction.Style.cancel) { UIAlertAction in
                self.startButton.isEnabled=true
                
                self.score = 0
                self.scoreLabel.text = "score : \(self.score)"
                self.kenny1.isUserInteractionEnabled = false
                self.kenny2.isUserInteractionEnabled = false
                self.kenny3.isUserInteractionEnabled = false
                self.kenny4.isUserInteractionEnabled = false
                self.kenny5.isUserInteractionEnabled = false
                self.kenny6.isUserInteractionEnabled = false
                self.kenny7.isUserInteractionEnabled = false
                self.kenny8.isUserInteractionEnabled = false
                self.kenny9.isUserInteractionEnabled = false
                
                if self.score > self.hScore{
                    self.hScore = self.score
                    self.hScoreLabel.text = "high score : \(self.hScore)"
                    
                }
            }
            
            
            let replayAction = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //replay button clicked
                self.score = 0
                self.scoreLabel.text = "score : \(self.score)"
                self.counter = 30
                self.timeLabel.text = "time : \(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.kennyHide), userInfo: nil, repeats: true)
           
                self.kenny1.isUserInteractionEnabled = true
                self.kenny2.isUserInteractionEnabled = true
                self.kenny3.isUserInteractionEnabled = true
                self.kenny4.isUserInteractionEnabled = true
                self.kenny5.isUserInteractionEnabled = true
                self.kenny6.isUserInteractionEnabled = true
                self.kenny7.isUserInteractionEnabled = true
                self.kenny8.isUserInteractionEnabled = true
                self.kenny9.isUserInteractionEnabled = true
                
                
            }
            UserDefaults.standard.set(self.hScore, forKey: "highScore")
            alert.addAction(okAction)
            alert.addAction(replayAction)
            present(alert, animated: true, completion: nil)
            for kenny in kennyArray {
                kenny.isHidden = false
            }
            
        }
    }
    @objc func pauseButtonPressed(){
        timer.invalidate()
        hideTimer.invalidate()
        let alert = UIAlertController(title: "Pause", message: "Are you sure you want to quit the game?", preferredStyle: .alert)
        let quitAction = UIAlertAction(title: "Quit", style: UIAlertAction.Style.cancel) { UIAlertAction in
            //çıkış yapacak
            self.performSegue(withIdentifier: "toGirisVC", sender: nil)
        }
        let resumeAction=UIAlertAction(title: "Resume", style: UIAlertAction.Style.default) { UIAlertAction in
            //devam edince yapılacak
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            self.hideTimer = Timer.scheduledTimer(timeInterval: self.number, target: self, selector: #selector(self.kennyHide), userInfo: nil, repeats: true)
        }
        alert.addAction(quitAction)
        alert.addAction(resumeAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

