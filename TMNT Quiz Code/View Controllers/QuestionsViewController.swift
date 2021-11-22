//
//  QuestionsViewController.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 21.11.2021.
//

import UIKit

class QuestionsViewController: UIViewController {

    // MARK: - UIProperties
    // GENERAL
    // questionLabel
    private var questionLabel: UILabel = {
        var questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "Question"
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 2
        return questionLabel
    }()
    // progressLine
    private var progressLine: UIProgressView = {
        var progressLine = UIProgressView()
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        return progressLine
    }()
    // general stackViews
    lazy private var stackViews: [UIStackView] = {
        // FIRST QUESTION
        let firstQuestionStackView = UIStackView()
        firstQuestionStackView.distribution = .equalSpacing
        firstQuestionStackView.spacing = 0
        
        // SECOND QUESTION
        let secondQuestionStackView = UIStackView()
        secondQuestionStackView.distribution = .equalSpacing
        secondQuestionStackView.spacing = size.height * 0.02232143
        
        let stackViews = [firstQuestionStackView, secondQuestionStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.backgroundColor = .clear
            stackView.tag = index
        }
        
        return stackViews
    }()
    
    // FIRST QUESTION
    // firstQuestionButtons
    private let firstQuestionButtons: [UIButton] = {
        let firstButton = UIButton()
        let secondButton = UIButton()
        let thirdButton = UIButton()
        let forthButton = UIButton()
        
        let buttons = [firstButton, secondButton, thirdButton, forthButton]
        
        let colorNames: [Int : String] = [0 : ColorNames.purple.rawValue, 1 : ColorNames.blue.rawValue, 2 : ColorNames.orange.rawValue, 3 : ColorNames.red.rawValue]
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitle(colorNames[index], for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
        }
        
        return buttons
    }()
    
    // SECOND QUESTION
    // stackViewsImageViewsSecondQuestion
    lazy private var stackViewsImageViewsSecondQuestion: [UIStackView] = {
        let topStackView = UIStackView()
        let bottomStackView = UIStackView()
        
        let stackViews = [topStackView, bottomStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.backgroundColor = .clear
            stackView.tag = index
            stackView.spacing = size.width * 0.04830918
        }
        
        return stackViews
    }()
    private let imageViewsSecondQuestion: [UIImageView] = {
        let topLeftImageView = UIImageView()
        let topRightImageView = UIImageView()
        let bottomLeftImageView = UIImageView()
        let bottomRightImageView = UIImageView()
        
        let imageViews = [topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView]
        
        let imageNames: [Int : String] = [0 : ImageNamesQuestionsViewControllerSecondQuestion.batman.rawValue, 1 : ImageNamesQuestionsViewControllerSecondQuestion.captainAmerica.rawValue, 2 : ImageNamesQuestionsViewControllerSecondQuestion.spiderMan.rawValue, 3 : ImageNamesQuestionsViewControllerSecondQuestion.darthVader.rawValue]
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.tag = index
            imageView.translatesAutoresizingMaskIntoConstraints = false
            if let imageName = imageNames[imageView.tag] {
                imageView.image = UIImage(named:  imageName)
            }
        }
        
        return imageViews
    }()
    
    // MARK: - Propeties
    var size: CGSize!
    var factor: CGFloat!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        size = view.bounds.size
        factor = min(size.height, size.width)
        
        // view
        view.backgroundColor = .white
        
        // GENERAL
        view.addSubview(questionLabel)
        view.addSubview(progressLine)
        
        
        // stackViews
        for stackView in stackViews {
            view.addSubview(stackView)
            switch stackView.tag {
            case 0:
                // FIRST QUESTION
                addElementsFirstQuestion(stackView: stackView)
//                stackView.isHidden = true
            case 1:
                // SECOND QUESTION
                addElemetnsSecondQuestion(stackView: stackView)
                stackView.isHidden = true
            default:
                print("error")
            }
        }
        
        addConstraints()
    }
    
    // MARK: - Constrains and size
    // Add constrains
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        let size = UIScreen.main.bounds
        
        //Add
        // GENERAL
        // questionLabel
        constraints.append(questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: size.width * 0.0625))
        constraints.append(questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -size.width * 0.0625))
        constraints.append(questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        // progressLine
        constraints.append(progressLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: size.width * 0.0625))
        constraints.append(progressLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -size.width * 0.0625))
        constraints.append(progressLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -size.width * 0.0625))
        
        // stackViews
        for stackView in stackViews {
            constraints.append(stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
            constraints.append(stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        }
        
        // FIRST QUESTION
        // firstQuestionButtons
        for button in firstQuestionButtons {
            constraints.append(button.heightAnchor.constraint(equalToConstant: size.height * 0.058))
            constraints.append(button.widthAnchor.constraint(equalToConstant: size.width * 0.362))
        }

        // SECOND QUESTION
        for imageView in imageViewsSecondQuestion {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: size.width * 0.25))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: size.width * 0.25))
        }
        
        // Activate
        NSLayoutConstraint.activate(constraints)
        
        addSize()
    }
    
    // Add correct size
    private func addSize() {
        // GENERAL
        questionLabel.font = UIFont.systemFont(ofSize: factor / 16)
        
        // FIRST QUESTION
        // firstQuestionButtons
        for button in firstQuestionButtons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: factor / 16)
        }
    }
    
    // MARK: - Add Views in StackViews
    // FIRST QUESTION
    private func addElementsFirstQuestion(stackView: UIStackView) {
        // firstQuestionButtons
        for button in firstQuestionButtons {
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    // SECOND QUESTION
    private func addElemetnsSecondQuestion(stackView: UIStackView) {
        // stackViewsImageViewsSecondQuestion, imageViewsSecondQuestion
        for (index, stackViewImageView) in stackViewsImageViewsSecondQuestion.enumerated() {
            stackView.addArrangedSubview(stackViewImageView)
            for imageView in imageViewsSecondQuestion {
                switch imageView.tag {
                case ..<Int(imageViewsSecondQuestion.count / 2):
                    if index < stackViewsImageViewsSecondQuestion.count / 2 {
                        stackViewImageView.addArrangedSubview(imageView)
                    }
                case Int(imageViewsSecondQuestion.count / 2)...:
                    if index >= stackViewsImageViewsSecondQuestion.count / 2 {
                        stackViewImageView.addArrangedSubview(imageView)
                    }
                default:
                    print("error")
                }
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
                imageView.addGestureRecognizer(tapGesture)
                imageView.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: - Actions
    // FIRST QUESTION
    @objc private func didTapButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("purple")
        case 1:
            print("blue")
        case 2:
            print("orange")
        case 3:
            print("red")
        default:
            print("error")
        }
    }
    
    // SECOND QUESTION
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        switch gesture.view?.tag {
        case 0:
            print("batman")
        case 1:
            print("captain - amerika")
        case 2:
            print("spider - man")
        case 3:
            print("darth - vaider")
        default:
            print("error")
        }
    }
}
