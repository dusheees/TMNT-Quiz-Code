//
//  QuestionsViewController.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 21.11.2021.
//

import UIKit

class QuestionsViewController: UIViewController {

    // MARK: - UIProperties General
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
        firstQuestionStackView.spacing = 0
        firstQuestionStackView.axis = .vertical
        
        // SECOND QUESTION
        let secondQuestionStackView = UIStackView()
        secondQuestionStackView.spacing = size.height * 0.02232143
        secondQuestionStackView.axis = .vertical
        
        // THIRD QUESTION
        let thirdQuestionStackView = UIStackView()
        thirdQuestionStackView.spacing = size.height * 0.02232143
        thirdQuestionStackView.axis = .vertical
        
        // FOURTH QUESTION
        let fourthQuestionStackView = UIStackView()
        fourthQuestionStackView.spacing = size.height * 0.02232143
        fourthQuestionStackView.axis = .vertical
        
        // FIFTH QUESTION
        let fifthQuestionStackView = UIStackView()
        fifthQuestionStackView.spacing = size.height * 0.02232143
        fifthQuestionStackView.axis = size.height < size.width ? .horizontal : .vertical
        
        let stackViews = [firstQuestionStackView, secondQuestionStackView,
                          thirdQuestionStackView, fourthQuestionStackView, fifthQuestionStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .equalSpacing
            stackView.backgroundColor = .clear
            stackView.tag = index
        }
        
        return stackViews
    }()
    
    // MARK: - UIProperties FIRST QUESTION
    // firstQuestionButtons
    private let firstQuestionButtons: [UIButton] = {
        let firstButton = UIButton()
        let secondButton = UIButton()
        let thirdButton = UIButton()
        let forthButton = UIButton()
        
        let buttons = [firstButton, secondButton, thirdButton, forthButton]
        
        let colorNames: [Int : String] = [0 : ColorNames.purple.rawValue, 1 : ColorNames.blue.rawValue,
                                          2 : ColorNames.orange.rawValue, 3 : ColorNames.red.rawValue]
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitle(colorNames[index], for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
        }
        
        return buttons
    }()
    
    // MARK: - UIProperties SECOND QUESTION
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
    // imageViewsSecondQuestion
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
    
    // MARK: - UIProperties THIRD QUESTION
    // stackViewsImageViewsSecondQuestion
    private var stackViewsThirdQuestion: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.backgroundColor = .clear
            stackView.tag = index
        }
        
        return stackViews
    }()
    // imageViewsThirdQuestion
    private let imageViewsThirdQuestion: [UIImageView] = {
        let leftImageView = UIImageView()
        let rightImageView = UIImageView()
        
        let imageViews = [leftImageView, rightImageView]
        
        let imageNames: [Int : String] = [0 : ImageNamesQuestionsViewControllerThirdQuestion.alone.rawValue, 1 : ImageNamesQuestionsViewControllerThirdQuestion.team.rawValue]
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tag = index
            if let imageName = imageNames[imageView.tag] {
                imageView.image = UIImage(named:  imageName)
            }
        }
        
        return imageViews
    }()
    // slider
    private let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    // labelsThirdQuestion
    private let labelsThirdQuestion: [UILabel] = {
        let leftLabel = UILabel()
        let rightLabel = UILabel()
        
        let labels = [leftLabel, rightLabel]
        
        let labelsText: [Int : String] = [0 : LabelTextQuestionsViewControllerThirdQuestion.alone.rawValue, 1 : LabelTextQuestionsViewControllerThirdQuestion.team.rawValue]
        
        for (index, label) in labels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = index
            label.textColor = .black
            label.sizeToFit()
            if let labelText = labelsText[label.tag] {
                label.text = labelText
            }
        }
        
        return labels
    }()
    // buttonThirdQuestion
    private let buttonThirdQuestion: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("To answer", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(didTapButtonThirdQuestion), for: .touchUpInside)
        return button
    }()
    
    // MARK: - UIProperties FOURTH QUESTION
    // generalStackViewFourthQuestion
    private let generalStackViewFourthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
    }()
    // stackViewsFourthQuestion
    private let stackViewsFourthQuestion: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.backgroundColor = .clear
            stackView.tag = index
        }
        
        return stackViews
    }()
    // labelsFourthQuestion
    private let labelsFourthQuestion: [UILabel] = {
        let firstLabel = UILabel()
        let secondLabel = UILabel()
        let thirdLabel = UILabel()
        let fourthLabel = UILabel()
        
        let labels = [firstLabel, secondLabel, thirdLabel, fourthLabel]
        
        let labelsText: [Int : String] = [0 : LabelTextQuestionsViewControllerFourthQuestion.firstQuality.rawValue, 1 : LabelTextQuestionsViewControllerFourthQuestion.secondQuality.rawValue, 2 : LabelTextQuestionsViewControllerFourthQuestion.thirdQuality.rawValue, 3 : LabelTextQuestionsViewControllerFourthQuestion.fourthQuality.rawValue]
        
        for (index, label) in labels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = index
            label.textColor = .black
            label.sizeToFit()
            if let labelText = labelsText[label.tag] {
                label.text = labelText
            }
        }
        
        return labels
    }()
    // switches
    private let switchesFourthQuestion: [UISwitch] = {
        let firstSwitch = UISwitch()
        let secondSwitch = UISwitch()
        let thirdSwitch = UISwitch()
        let fourthSwitch = UISwitch()

        let switches = [firstSwitch, secondSwitch, thirdSwitch, fourthSwitch]
        
        for `switch` in switches {
            `switch`.translatesAutoresizingMaskIntoConstraints = false
            `switch`.isOn = false
        }
        
        return switches
    }()
    // buttonFourthQuestion
    private let buttonFourthQuestion: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("To answer", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        
        button.addTarget(self, action: #selector(didTapButtonFourthQuestion), for: .touchUpInside)
        return button
    }()
    
    // MARK: - UIProperties FIFTH QUESTION
    // verticalStackViewsFifthQuestion
    lazy private var verticalStackViewsFifthQuestion: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()

        let stackViews = [firstStackView, secondStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = size.height * 0.02232143
            stackView.tag = index
            stackView.backgroundColor = .clear
        }
        
        return stackViews
    }()
    // horizontalStackViewsFifthQuestion
    lazy private var horizontalStackViewsFifthQuestion: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = size.width * 0.0483
            stackView.tag = index
            stackView.backgroundColor = .clear
        }
        
        return stackViews
    }()
    // buttonsFifthQuestion
    private let buttonsFifthQuestion: [UIButton] = {
        let firstButton = UIButton()
        let secondButton = UIButton()
        let thirdButton = UIButton()
        let fourthButton = UIButton()
        let fifthButton = UIButton()
        let sixthButton = UIButton()
        let seventhbutton = UIButton()
        let eighthButton = UIButton()
        
        let buttons = [firstButton, secondButton, thirdButton, fourthButton,
                       fifthButton, sixthButton, seventhbutton, eighthButton]
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitle("?", for: .normal)
            button.backgroundColor = .orange
        }
        
        return buttons
    }()
    // resultStackViewFifthQuestion
    lazy private var resultStackViewFifthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = size.height * 0.02232143
        
        return stackView
    }()
    // resultInnerStackViewFifthQuestion
    private let resultInnerStackViewFifthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    // resultLabelFifthQuestion
    private var resultLabelFifthQuestion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "TEXT"
        return label
    }()
    private let resultButtonsFifthQuestion: [UIButton] = {
        let leftButton = UIButton()
        leftButton.setTitle(SecondButtonsText.leftButton, for: .normal)
        let rightButton = UIButton()
        rightButton.setTitle(SecondButtonsText.rightButton, for: .normal)
        
        let buttons = [leftButton, rightButton]
        for (index, button) in buttons.enumerated(){
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitleColor(.systemBlue, for: .normal)
        }
        
        return buttons
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
                stackView.isHidden = true
            case 1:
                // SECOND QUESTION
                addElemetnsSecondQuestion(stackView: stackView)
                stackView.isHidden = true
            case 2:
                // THIRD QUESTION
                addElementsThirdQuestion(stackView: stackView)
                stackView.isHidden = true
            case 3:
                addElementsFourthQuestion(stackView: stackView)
                stackView.isHidden = true
            case 4:
                addElementsFifthQuestion(stackView: stackView)

            default:
                print("error")
            }
        }
        
        addConstraints()
    }
    
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
        // imageViewsSecondQuestion
        for imageView in imageViewsSecondQuestion {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: size.width * 0.25))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: size.width * 0.25))
        }
        
        // THIRD QUESTION
        // stackViewsThirdQuestion
        for innerStackView in stackViewsThirdQuestion {
            constraints.append(innerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: size.width * 0.04830918))
            constraints.append(innerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -size.width * 0.04830918))

        }
        // imageViewsThirdQuestion
        for imageView in imageViewsThirdQuestion {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: size.width * 0.15))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: size.width * 0.15))
        }
        
        // FOURTH QUESTION
        // stackViewsFourthQuestion
        for innerStackView in stackViewsFourthQuestion {
            constraints.append(innerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: size.width * 0.04830918))
            constraints.append(innerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -size.width * 0.04830918))

        }
        
        // FIFTH QUESTION
        // buttonsFifthQuestion
        for button in buttonsFifthQuestion {
            constraints.append(button.heightAnchor.constraint(equalToConstant: size.height * 0.12))
            constraints.append(button.widthAnchor.constraint(equalToConstant: size.height * 0.12))
        }
        // resultStackViewFifthQuestion
        constraints.append(resultStackViewFifthQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        constraints.append(resultStackViewFifthQuestion.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        // resultInnerStackViewFifthQuestion
        constraints.append(resultInnerStackViewFifthQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: size.width * 0.04830918))
        constraints.append(resultInnerStackViewFifthQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -size.width * 0.04830918))
        
        
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
        
        // THIRD QUESTION
        // labelsThirdQuestion
        for label in labelsThirdQuestion {
            label.font = UIFont.systemFont(ofSize: factor / 19)
        }
        // buttonThirdQuestion
        buttonThirdQuestion.titleLabel?.font = UIFont.systemFont(ofSize: factor / 16)
        
        // FOURTH QUESTION
        // labelsFourthQuestion
        for label in labelsFourthQuestion {
            label.font = UIFont.systemFont(ofSize: factor / 19)
        }
        // switches
        for `switch` in switchesFourthQuestion {
            `switch`.transform = CGAffineTransform(scaleX: factor / 500, y: factor / 500)
        }
        // buttonFourthQuestion
        buttonFourthQuestion.titleLabel?.font = UIFont.systemFont(ofSize: factor / 16)
        
        // FIFTH QUESTION
        // buttonsFifthQuestion
        for button in buttonsFifthQuestion {
            button.titleLabel?.font = UIFont.systemFont(ofSize: factor / 10)
        }
        // resultLabelFifthQuestion
        resultLabelFifthQuestion.font = UIFont.systemFont(ofSize: factor / 16)
        // resultButtonsFifthQuestion
        for button in resultButtonsFifthQuestion {
            button.titleLabel?.font = UIFont.systemFont(ofSize: factor / 16)
        }
    }
    
    // MARK: - Add Views in StackViews
    // FIRST QUESTION
    private func addElementsFirstQuestion(stackView: UIStackView) {
        // firstQuestionButtons
        for button in firstQuestionButtons {
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButtonFirstQuestion), for: .touchUpInside)
        }
    }
    // SECOND QUESTION
    private func addElemetnsSecondQuestion(stackView: UIStackView) {
        for (index, stackViewImageView) in stackViewsImageViewsSecondQuestion.enumerated() {
            // stackViewsImageViewsSecondQuestion
            stackView.addArrangedSubview(stackViewImageView)
            for imageView in imageViewsSecondQuestion {
                switch imageView.tag {
                // imageViewsSecondQuestion
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
    // THIRD QUESTION
    private func addElementsThirdQuestion(stackView: UIStackView) {
        for innerStackView in stackViewsThirdQuestion {
            // stackViewsThirdQuestion
            stackView.addArrangedSubview(innerStackView)
            switch innerStackView.tag {
            case 0:
                // imageViewsThirdQuestion
                for imageView in imageViewsThirdQuestion{
                    innerStackView.addArrangedSubview(imageView)
                }
            case 1:
                // slider
                innerStackView.addArrangedSubview(slider)
            case 2:
                // labelsThirdQuestion
                for label in labelsThirdQuestion{
                    innerStackView.addArrangedSubview(label)
                }
            case 3:
                // buttonThirdQuestion
                innerStackView.addArrangedSubview(buttonThirdQuestion)
            default:
                print("error")
            }
        }
    }
    // FOURTH QUESTION
    private func addElementsFourthQuestion(stackView: UIStackView) {
        stackView.addArrangedSubview(generalStackViewFourthQuestion)
        for (index, innerStackView) in stackViewsFourthQuestion.enumerated() {
            // stackViewsThirdQuestion
            generalStackViewFourthQuestion.addArrangedSubview(innerStackView)
            if labelsFourthQuestion.indices.contains(index), switchesFourthQuestion.indices.contains(index) {
                innerStackView.addArrangedSubview(labelsFourthQuestion[index])
                innerStackView.addArrangedSubview(switchesFourthQuestion[index])
            }
        }
        stackView.addArrangedSubview(buttonFourthQuestion)
    }
    // FIFTH QUESTION
    private func addElementsFifthQuestion(stackView: UIStackView) {
        for innerStackView in verticalStackViewsFifthQuestion {
            // verticalStackViewsFifthQuestion
            stackView.addArrangedSubview(innerStackView)
            for horizontalInnerStackView in horizontalStackViewsFifthQuestion {
                if innerStackView.tag % 2 == 0, horizontalInnerStackView.tag % 2 == 0 {
                    // horizontalStackViewsFifthQuestion
                    innerStackView.addArrangedSubview(horizontalInnerStackView)
                } else if innerStackView.tag % 2 != 0, horizontalInnerStackView.tag % 2 != 0{
                    // horizontalStackViewsFifthQuestion
                    innerStackView.addArrangedSubview(horizontalInnerStackView)
                }
            }
        }
        // buttonsFifthQuestion
        for (index, horizontalInnerStackView) in horizontalStackViewsFifthQuestion.enumerated() {
            for button in buttonsFifthQuestion {
                switch button.tag {
                case ..<Int(buttonsFifthQuestion.count / 4):
                    if index < horizontalStackViewsFifthQuestion.count / 4 {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsFifthQuestion.count / 4)..<Int(buttonsFifthQuestion.count / 2):
                    if index >= horizontalStackViewsFifthQuestion.count / 4, index < horizontalStackViewsFifthQuestion.count / 2 {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsFifthQuestion.count / 2)..<Int(buttonsFifthQuestion.count - buttonsFifthQuestion.count / 4):
                    if index >= horizontalStackViewsFifthQuestion.count / 2, index < (horizontalStackViewsFifthQuestion.count - horizontalStackViewsFifthQuestion.count / 4) {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsFifthQuestion.count - buttonsFifthQuestion.count / 4)..<Int(buttonsFifthQuestion.count):
                    if index >= (horizontalStackViewsFifthQuestion.count - horizontalStackViewsFifthQuestion.count / 4), index < (horizontalStackViewsFifthQuestion.count) {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                default:
                    print("error")
                }
                button.addTarget(self, action: #selector(didTapButtonFifthQuestion), for: .touchUpInside)
            }
        }
        // resultStackViewFifthQuestion
        stackView.addSubview(resultStackViewFifthQuestion)
        resultStackViewFifthQuestion.isHidden = true
        // resultLabelFifthQuestion
        resultStackViewFifthQuestion.addArrangedSubview(resultLabelFifthQuestion)
        // resultInnerStackViewFifthQuestion
        resultStackViewFifthQuestion.addArrangedSubview(resultInnerStackViewFifthQuestion)
        // resultButtonsFifthQuestion
        for button in resultButtonsFifthQuestion {
            resultInnerStackViewFifthQuestion.addArrangedSubview(button)
        }
        
        
    }

    
    // MARK: - Actions
    // viewWillTransition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        stackViews[4].axis = size.height < size.width ? .horizontal : .vertical
    }
    
    // FIRST QUESTION
    @objc private func didTapButtonFirstQuestion(_ sender: UIButton) {
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
    
    // THIRD QUESTION
    @objc private func didTapButtonThirdQuestion(_ sender: UIButton) {
        print("THIRD QUESTION")
    }
    
    // FOURTH QUESTION
    @objc private func didTapButtonFourthQuestion(_ sender: UIButton) {
        print("FOURTH QUESTION")
    }
    
    // FIFTH QUESTION
    @objc private func didTapButtonFifthQuestion(_ sender: UIButton) {
        for button in buttonsFifthQuestion {
            button.isEnabled = false
        }
        
        let buttonsText: [Int : String] = [0 : FirstButtonText.firstButton.rawValue,
                                           1 : FirstButtonText.secondButton.rawValue,
                                           2 : FirstButtonText.thirdButton.rawValue,
                                           3 : FirstButtonText.fourthButton.rawValue,
                                           4 : FirstButtonText.fifthButton.rawValue,
                                           5 : FirstButtonText.sixthButton.rawValue,
                                           6 : FirstButtonText.seventhbutton.rawValue,
                                           7 : FirstButtonText.eighthButton.rawValue]
        
        
        if let buttonText = buttonsText[sender.tag] {
            sender.setTitle(buttonText, for: [])
            resultLabelFifthQuestion.text = "Your ingredient: \(buttonText)"
        }
        sender.backgroundColor = .cyan
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            for innerStackView in self.verticalStackViewsFifthQuestion {
                innerStackView.isHidden = true
            }
            self.resultStackViewFifthQuestion.isHidden = false
        }
        
    }
    
    
}
