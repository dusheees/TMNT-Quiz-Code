//
//  ResultsViewController.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 26.11.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: - UIProperties
    // resultStackView
    private let resultStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = SizeScreen.sizeWidthHeight(SizeScreen.size.height) * 0.02232143
        
        return stackView
    }()
    // resultImageView
    private let resultImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    // resultLabel
    private let resultLabel: UILabel = {
        let resultLabel = UILabel()
        
        resultLabel.textAlignment = .center
        resultLabel.textColor = UIColor.black
        
        return resultLabel
    }()
    // descriptionLabel
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 7
        descriptionLabel.textColor = UIColor.black
        
        return descriptionLabel
    }()
    
    // MARK: - Properties
    var answers: [Answer] = []
    
    // MARK: - UIMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выход", style: .plain, target: self, action: #selector(dismissSelf))
        
        view.backgroundColor = .white
        navigationItem.title = "Результат"
        
        view.addSubview(resultStackView)
        resultStackView.addArrangedSubview(resultImageView)
        resultStackView.addArrangedSubview(resultLabel)
        resultStackView.addArrangedSubview(descriptionLabel)
        
        addConstraints()
        calculatePersonalityResult()
    }
    
    // update User Interface
    func updateUI(with turtle: TMNTType) {
        resultImageView.image = UIImage(named: turtle.defititionImage)
        resultLabel.text = "Вы - \(turtle.rawValue)!"
        descriptionLabel.text = turtle.definition
    }
    
    // Calculate results
    func calculatePersonalityResult() {
        let frequencyOfAnswers = answers.reduce(into: [:]) { counts, answer in
            counts[answer.type, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value > $1.value }.first!.key
        updateUI(with: mostCommonAnswer)
    }
    
    // Add constrains
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Add
        // resultStackView
        constraints.append(resultStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        constraints.append(resultStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        constraints.append(resultStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        // resultImageView
        constraints.append(resultImageView.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.35))
        constraints.append(resultImageView.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.35))
        
        // Activate
        NSLayoutConstraint.activate(constraints)
        
        addSize()
    }
    
    // Add correct size
    private func addSize() {
        guard let coefficient = SizeScreen.size.height / SizeScreen.size.width < 2 && SizeScreen.size.height / SizeScreen.size.width > 0.5 ? 37 : 27 else {
            return
        }
        // rightBarButtonItem
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize:  SizeScreen.giveFactor() / CGFloat(coefficient))], for: [])
        
        // resultLabel
        resultLabel.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        
        // descriptionLabel
        descriptionLabel.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 19)
    }
    
    // MARK: - Actions
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

}
