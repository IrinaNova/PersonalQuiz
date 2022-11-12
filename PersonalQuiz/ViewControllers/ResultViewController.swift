//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabels: [UILabel]!
    var answers: [Answer]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        getResult(answer: answers)
    }
   
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult (answer: [Answer]) {
        var animals: [Character] = []
        for answer in answers {
            animals.append(answer.animal.rawValue)
        }
        animals.sort(by: >)
        var count = 1
        var maxCount = 0
        var theMostAnimal: Character = " "
        for i in 0...(animals.count - 2) {
            if animals[i] == animals[i+1] {
                count += 1
            } else if maxCount < count {
                maxCount = count
                theMostAnimal = animals[i]
            }
            count = 1
        }
        guard let ourAnimal = Animal(rawValue: theMostAnimal) else {return}
        resultLabels[0].text = "Вы - \(ourAnimal.rawValue)"
        resultLabels[1].text = ourAnimal.definition
    }
    
    deinit{
        print("ResultVC has been delocated")
    }
    
}
