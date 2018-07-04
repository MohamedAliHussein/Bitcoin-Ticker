



import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var scor: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText 
        
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
  nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "score :\(scor)"
        progressLabel.text = "\(questionNumber + 1 )/ 13 "
        progressBar.frame.size.width = (view.frame.size.width / 13 ) * CGFloat( questionNumber )
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12{
        questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else{
          let aletr = UIAlertController(title: "Awesome", message: "you have finished all question , do you want to start again !", preferredStyle: .alert)
        
            let restartAction = UIAlertAction(title: "Restart", style: .default) {(UIAlertAction
                ) in
                self.startOver()
            }
            aletr.addAction(restartAction)
            present(aletr, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
        ProgressHUD.showSuccess("Correct")
            scor = scor + 1
        }else{
            ProgressHUD.showError("Error !")
        }
      
        
        
    }
    
    
    func startOver() {
        scor = 0
        questionNumber = 0
        nextQuestion()
       
    }
    

    
}
