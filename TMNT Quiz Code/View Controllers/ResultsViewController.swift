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
    lazy private var resultStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = sizeWidthHeight(size.height) * 0.02232143
        
        return stackView
    }()
    // resultImageView
    private let resultImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "leonardo@x1")
        
        return imageView
    }()
    // resultLabel
    private let resultLabel: UILabel = {
        let resultLabel = UILabel()
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.textAlignment = .center
        
        return resultLabel
    }()
    // descriptionLabel
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 7
        
        return descriptionLabel
    }()
    
    // MARK: - Properties
    var size: CGSize!
    var factor: CGFloat!
    
    var answers: [Answer] = []
    
    // MARK: - UIMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Завершить", style: .plain, target: self, action: #selector(dismissSelf))
        
        view.backgroundColor = .white
        navigationItem.title = "Результат"
        
        size = view.bounds.size
        factor = min(size.height, size.width)
        
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
        constraints.append(resultStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        constraints.append(resultStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        constraints.append(resultStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.0625))
        constraints.append(resultStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.0625))
        // resultImageView
        constraints.append(resultImageView.heightAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.35))
        constraints.append(resultImageView.widthAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.35))
        
        // Activate
        NSLayoutConstraint.activate(constraints)
        
        addSize()
    }
    
    // Add correct size
    private func addSize() {
        // general
        // rightBarButtonItem
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.systemFont(ofSize:  factor / 32)], for: [])
        
        // resultLabel
        resultLabel.font = UIFont.systemFont(ofSize: factor / 16)
        
        // descriptionLabel
        descriptionLabel.font = UIFont.systemFont(ofSize: factor / 19)
    }
    
    private func sizeWidthHeight(_ invertSize: CGFloat) -> CGFloat {
        if size.width < size.height {
            switch invertSize {
            case size.width: return size.width
            default: return size.height
            }
        } else {
            switch invertSize {
            case size.width: return size.height
            default: return size.width
            }
        }
    }
    
    // MARK: - Actions
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

}
