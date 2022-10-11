//
//  ResultViewController.swift
//  AnimalQuiz
//
//  Created by Ксн Тлскн on 09.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var userAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    @IBAction func donaButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

}

extension ResultViewController {
    private func updateResult() {
        var frequencyOfAnimals: [Animal : Int] = [:]
        let animals = userAnswers.map { $0.animal }
        
        for animal in animals {
            frequencyOfAnimals[animal, default: 0] += 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value
        }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
