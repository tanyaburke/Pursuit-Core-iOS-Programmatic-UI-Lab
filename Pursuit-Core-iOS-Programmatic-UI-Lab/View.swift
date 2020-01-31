//
//  View.swift
//  Pursuit-Core-iOS-Programmatic-UI-Lab
//
//  Created by Tanya Burke on 1/29/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class View: UIView {
    
    //       var randRed = CGFloat.random(in: 0...1)
    //          var randGreen = CGFloat.random(in: 0...1)
    //          var randBlue = CGFloat.random(in: 0...1)
    var score = Int()
    //      var highestScore = 0
    var gameOver = Bool()
    
    let myColor = ColorGuessingModel()
    
    
    var defaultMessage = "Guess the Dominant Color"
    
    //create a label
    public lazy var messageLabel: UILabel = { //done when its needed gets created after main view is initiated
        
        //guarantees an instance exists before the body gets called
        let label = UILabel()//created and intialize the label
        label.text = defaultMessage
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.backgroundColor = .systemTeal
        label.numberOfLines = 0
        return label// return object to whoever called it
        
        
    }()// creates a closure and calls simultaneously
    
    //create a button
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .systemYellow
//        button.addTarget(self, action: #selector(resetLogic), for: .touchUpInside)
        return button
    }()
    
    
    
    public lazy var colorScreen: UIImageView = {
        var colorScreen = UIImageView()
        colorScreen.backgroundColor = self.myColor.getNewColor()
        
        
        return colorScreen
    }()
    
    public lazy var redButton:UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemRed
        button.tag = 0
//        button.addTarget(self, action: #selector(colorLogic(_:)), for: .touchUpInside)
        return button
    }()
    
    public lazy var greenButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemGreen
        button.tag = 2
//        button.addTarget(self, action: #selector(colorLogic(_:)), for: .touchUpInside)
        
        return button
    }()
    
    
    public lazy var blueButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .systemBlue
        button.tag = 1
//        button.addTarget(self, action: #selector(colorLogic(_:)), for: .touchUpInside)
        return button
    }()
    
    
    public lazy var stackView: UIStackView = {
        var stack = UIStackView()
        stack.addArrangedSubview(redButton)
        stack.addArrangedSubview(greenButton)
        stack.addArrangedSubview(blueButton)
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }()
    
    
    
    
    private func setUpColorScreen(){
        
        addSubview(colorScreen)
        colorScreen.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            colorScreen.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            colorScreen.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorScreen.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorScreen.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
            
            
        ] )
    }
    
    
    private func setUpMessageLabelConstraints(){
        //add the messageLabel to the main view
        addSubview(messageLabel)//return the messageLabel we created above
        
        //set constraints for the message label
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([//mnagaes constraints in code
            ////set horizontal constraint center of Main view
            //set top anchor 20 points from safe are top
            messageLabel.topAnchor.constraint(equalTo: colorScreen.bottomAnchor, constant: 20),
            
            
            //set padding at the leading edge of the MainView
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //set padding at the trailing of the MainView
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
        //if don't set in array, can do each constraint individually
        //    messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20) isactive = true// if done individually
    }
    
    private func setUpStackView(){
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
    
    
    private func setUPResetButtonConstraints(){
        //steps adding constraints
        //1:
        addSubview(resetButton)
        
        //2:
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        //3:
        //set constraints
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40)
            
            
        ])
        
    }
    
    //sub class of UIVIew
    //init(frame: ) gets called wwhen view is done programmatically
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    //if this view get initialized from storyboard
    //this intializer gets called
    required init?(coder: NSCoder) { //failable initializer, could fail, object comes back nil
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpColorScreen()
        setUpMessageLabelConstraints()
        setUpStackView()
        setUPResetButtonConstraints()
//        colorLogic()
    }
    
    @objc
    func colorLogic(_ sender: Int)-> Bool{
        
        //            if gameOver == false {
        switch sender {
        case 0:
            if  myColor.isDominant(guess: UIColor.red) {
                defaultMessage = "Correct Choice\n Score:\(score)"
                score = score + 1
               
                colorScreen.backgroundColor = myColor.getNewColor()
            } else {
              defaultMessage = "Incorrect\n Would you like to play again, Press the Reset Button/n Final Score:\(score)"
                gameOver = true
                 return gameOver
            }
            
        case 1:
            if myColor.isDominant(guess: UIColor.blue) {
                defaultMessage = "Correct Choice\n Score:\(score)"
                score = score + 1
                
                colorScreen.backgroundColor = myColor.getNewColor()
            } else {
               defaultMessage = "Incorrect\n Would you like to play again, Press the Reset Button/n Final Score:\(score)"
                gameOver = true
                 return gameOver
            }
        case 2:
            if myColor.isDominant(guess: UIColor.green){
                defaultMessage = "Correct Choice\n Score:\(score)"
                score = score + 1
                colorScreen.backgroundColor = myColor.getNewColor()
                
            } else {
               defaultMessage = "Incorrect\n Would you like to play again, Press the Reset Button/n Final Score:\(score)"
                gameOver = true
                return gameOver
            }
        default:
               defaultMessage = "Try again"
        }
        
        
        //            if highestScore <= score {
        //               let highestScores = score
        //
        //            scoreLabel.text = "Score: \(score)\n Highest Score: \(highestScores)"
        //                   }
        
         return gameOver
    }
    
    @objc
    func resetLogic() -> Bool{
       
        colorScreen.backgroundColor = myColor.getNewColor()
        self.messageLabel.text = defaultMessage
        //    choiceLabel.text = " "
        score = 0
        gameOver = false
        return gameOver
    }
    
    
}




