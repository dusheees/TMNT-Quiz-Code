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
    private let questionLabel: UILabel = {
        var questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 2
        return questionLabel
    }()
    // progressLine
    private let progressLine: UIProgressView = {
        var progressLine = UIProgressView()
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        return progressLine
    }()
    // general stackViews
    lazy private var stackViews: [UIStackView] = {
        let firstQuestionStackView = UIStackView()
        let secondQuestionStackView = UIStackView()
        let thirdQuestionStackView = UIStackView()
        let fourthQuestionStackView = UIStackView()
        let fifthQuestionStackView = UIStackView()
        
        let stackViews = [
            firstQuestionStackView, secondQuestionStackView,
            thirdQuestionStackView, fourthQuestionStackView,
            fifthQuestionStackView,
        ]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .equalSpacing
            stackView.backgroundColor = .clear
            stackView.tag = index
            
            if stackView == firstQuestionStackView { stackView.spacing = 0 } else {
                stackView.spacing = sizeWidthHeight(size.height) * 0.02232143
            }
            
            if stackView == fifthQuestionStackView {
                stackView.axis = size.height < size.width ? .horizontal : .vertical
            } else { stackView.axis = .vertical }
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
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
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
            stackView.spacing = sizeWidthHeight(size.width) * 0.04830918
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

        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tag = index
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
        
        let imageNames: [Int : String] = [0 : "alone@x1", 1 : "team@x1"]
        
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
        
        for (index, label) in labels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = index
            label.textColor = .black
            label.sizeToFit()
        }
        
        return labels
    }()
    // buttonThirdQuestion
    private let buttonThirdQuestion: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ответить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        
        return button
    }()
    
    // MARK: - UIProperties FOURTH QUESTION
    // generalStackViewFourthQuestion
    private let generalStackViewFourthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.backgroundColor = .black
        
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
            stackView.backgroundColor = .cyan
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
        
        for (index, label) in labels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = index
            label.textColor = .black
            label.sizeToFit()
            label.backgroundColor = .red
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
            `switch`.backgroundColor = .blue
        }
        
        return switches
    }()
    // buttonFourthQuestion
    private let buttonFourthQuestion: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ответить", for: .normal)
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
            stackView.spacing = sizeWidthHeight(size.height) * 0.02232143
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
            stackView.spacing = sizeWidthHeight(size.width) * 0.0483
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
            button.backgroundColor = UIColor(rgb: 0x91A200)
        }
        
        return buttons
    }()
    
    // MARK: - UIProperties RESULT FIFTH QUESTION
    private let resultStackViewFifthQuestion: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.isHidden = true
        return stackView
    }()
    // resultLabelStackViewFifthQuestion
    private let resultLabelStackViewFifthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    // resultInnerStackViewFifthQuestion
    private let resultInnerStackViewFifthQuestion: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        stackView.spacing = 0
        
        return stackView
    }()
    // resultLabelFifthQuestion
    private let resultLabelFifthQuestion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    // resultQuestionLabelFifthQuestion
    private let resultQuestionLabelFifthQuestion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Будем готовить ?"
        return label
    }()
    // resultButtonsFifthQuestion
    private let resultButtonsFifthQuestion: [UIButton] = {
        let leftButton = UIButton()
        leftButton.setTitle("НЕТ 🤢", for: .normal)
        let rightButton = UIButton()
        rightButton.setTitle("ДА 🔥", for: .normal)
        
        let buttons = [leftButton, rightButton]
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.setTitleColor(.systemBlue, for: .normal)
        }
        
        return buttons
    }()

    
    // MARK: - Propeties
    var size: CGSize!
    var factor: CGFloat!
    
    private var answersChosen = [Answer]()
    private var currentAnswers: [Answer] {
        Question.all[questionIndex].answers
    }
    private var currentQuestion: Question {
        Question.all[questionIndex]
    }
    private var questionIndex = 0
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in Question.all.indices {
            if Question.all[index].isShuffled {
                Question.all[index].answers = Question.all[index].answers.shuffled()
            }
        }
        Question.all = Question.all.shuffled()
        
        size = view.bounds.size
        factor = min(size.height, size.width)
        
        // view
        view.backgroundColor = .white
        
        // GENERAL
        view.addSubview(questionLabel)
        view.addSubview(progressLine)
                
        view.addSubview(resultStackViewFifthQuestion)
        // stackViews
        for stackView in stackViews {
            view.addSubview(stackView)
            switch stackView.tag {
            case 0:
                // FIRST QUESTION
                addElementsFirstQuestion(stackView: stackView)
            case 1:
                // SECOND QUESTION
                addElemetnsSecondQuestion(stackView: stackView)
            case 2:
                // THIRD QUESTION
                addElementsThirdQuestion(stackView: stackView)
            case 3:
                // FOURTH QUESTION
                addElementsFourthQuestion(stackView: stackView)
            case 4:
                // FIFTH QUESTION
                addElementsFifthQuestion(stackView: stackView)
                // RESULT FIFTH QUESTION
                addElementsResultFifthQuestion()
            default:
                print("error")
            }
        }
        
        addConstraints()
        updateUI()
    }
    
    // update User Interface
    func updateUI() {
        func updateSingleButtonsStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for button in firstQuestionButtons {
                button.setTitle(nil, for: [])
            }
            for (button, answer) in zip(firstQuestionButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateSingleImagesStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for (imageView, answer) in zip(imageViewsSecondQuestion, currentAnswers) {
                if let imageName = answer.image {
                    imageView.image = UIImage(named: imageName)
                }
            }
        }
        
        func updateRangeStack() {
            stackViews[currentQuestion.tag].isHidden = false
            labelsThirdQuestion.first?.text = currentAnswers.first?.text
            labelsThirdQuestion.last?.text = currentAnswers.last?.text
        }
        
        func updateMultiplyStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for label in labelsFourthQuestion {
                label.text = nil
            }
            for (label, answer) in zip(labelsFourthQuestion, currentAnswers) {
                label.text = answer.text
            }
        }
        
        func updateToggleButtonsStack() {
            let size = UIScreen.main.bounds
            stackViews[currentQuestion.tag].axis = size.height < size.width ? .horizontal : .vertical
            stackViews[currentQuestion.tag].isHidden = false
            for button in buttonsFifthQuestion {
                button.setTitle("?", for: [])
            }
        }
        
        for stackView in stackViews {
            stackView.isHidden = true
        }
        resultStackViewFifthQuestion.isHidden = true

        let totalprogress = Float(questionIndex) / Float(Question.all.count)
        
        navigationItem.title = "Вопрос №\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressLine.setProgress(totalprogress, animated: true)
        
        switch currentQuestion.type {
        case .singleButtons:
            updateSingleButtonsStack()
        case .singleImages:
            updateSingleImagesStack()
        case .range:
            updateRangeStack()
        case .multiply:
            updateMultiplyStack()
        case .toggleButtons:
            updateToggleButtonsStack()
        }
        
    }
    
    // Go to the next question
    func nextQuestion() {
        questionIndex = questionIndex + 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            questionIndex = 0
            let vc = ResultsViewController()
            vc.answers = answersChosen
            vc.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // Add constrains
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        //Add
        // GENERAL
        // questionLabel
        constraints.append(questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.0625))
        constraints.append(questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.0625))
        constraints.append(questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        // progressLine
        constraints.append(progressLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.0625))
        constraints.append(progressLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.0625))
        constraints.append(progressLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -sizeWidthHeight(size.width) * 0.0625))
        // stackViews
        for stackView in stackViews {
            constraints.append(stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
            constraints.append(stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        }
        
        // FIRST QUESTION
        // firstQuestionButtons
        for button in firstQuestionButtons {
            constraints.append(button.heightAnchor.constraint(equalToConstant: sizeWidthHeight(size.height) * 0.058))
            constraints.append(button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.04830918))
            constraints.append(button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.04830918))
        }

        // SECOND QUESTION
        // imageViewsSecondQuestion
        for imageView in imageViewsSecondQuestion {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.25))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.25))
        }
        
        // THIRD QUESTION
        // stackViewsThirdQuestion
        for innerStackView in stackViewsThirdQuestion {
            constraints.append(innerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.04830918))
            constraints.append(innerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.04830918))
        }
        // imageViewsThirdQuestion
        for imageView in imageViewsThirdQuestion {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.15))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: sizeWidthHeight(size.width) * 0.15))
        }
        
        // FOURTH QUESTION
        // stackViewsFourthQuestion
        constraints.append(generalStackViewFourthQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.04830918))
        constraints.append(generalStackViewFourthQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.04830918))
        
        // FIFTH QUESTION
        // buttonsFifthQuestion
        for button in buttonsFifthQuestion {
            constraints.append(button.heightAnchor.constraint(equalToConstant: sizeWidthHeight(size.height) * 0.12))
            constraints.append(button.widthAnchor.constraint(equalToConstant: sizeWidthHeight(size.height) * 0.12))
        }
        // RESULT FIFTH QUESTION
        // resultStackViewFifthQuestion
        constraints.append(resultStackViewFifthQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        constraints.append(resultStackViewFifthQuestion.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        // resultLabelStackViewFifthQuestion
        constraints.append(resultLabelStackViewFifthQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.04830918))
        constraints.append(resultLabelStackViewFifthQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.04830918))
        // resultInnerStackViewFifthQuestion
        constraints.append(resultInnerStackViewFifthQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: sizeWidthHeight(size.width) * 0.04830918))
        constraints.append(resultInnerStackViewFifthQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -sizeWidthHeight(size.width) * 0.04830918))
        
        
        // Activate
        NSLayoutConstraint.activate(constraints)
        
        addSize()
    }
    
    // Add correct size
    private func addSize() {
        // GENERAL
        // navigationController
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black , NSAttributedString.Key.font: UIFont.systemFont(ofSize: factor / 25)]
        // questionLabel
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
        // resultQuestionLabelFifthQuestion
        resultQuestionLabelFifthQuestion.font = UIFont.systemFont(ofSize: factor / 16)
        // resultButtonsFifthQuestion
        for button in resultButtonsFifthQuestion {
            button.titleLabel?.font = UIFont.systemFont(ofSize: factor / 16)
        }
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
                buttonThirdQuestion.addTarget(self, action: #selector(didTapButtonThirdQuestion), for: .touchUpInside)
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
    }
    // RESULT FIFTH QUESTION
    private func addElementsResultFifthQuestion() {
        // resultLabelStackViewFifthQuestion
        resultStackViewFifthQuestion.addArrangedSubview(resultLabelStackViewFifthQuestion)
        // resultLabelFifthQuestion
        resultLabelStackViewFifthQuestion.addArrangedSubview(resultLabelFifthQuestion)
        // resultQuestionLabelFifthQuestion
        resultLabelStackViewFifthQuestion.addArrangedSubview(resultQuestionLabelFifthQuestion)
        // resultInnerStackViewFifthQuestion
        resultStackViewFifthQuestion.addArrangedSubview(resultInnerStackViewFifthQuestion)
        // resultButtonsFifthQuestion
        for button in resultButtonsFifthQuestion {
            resultInnerStackViewFifthQuestion.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButtonResultFifthQuestion), for: .touchUpInside)
        }
    }
    
    // MARK: - Actions
    // viewWillTransition
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if currentQuestion.type == .toggleButtons {
            stackViews[currentQuestion.tag].axis = size.height < size.width ? .horizontal : .vertical
        }
    }
    
    // FIRST QUESTION
    @objc private func didTapButtonFirstQuestion(_ sender: UIButton) {
        let answer = currentAnswers[sender.tag]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    // SECOND QUESTION
    @objc private func tap(_ gesture: UITapGestureRecognizer) {
        guard let gestureTag = gesture.view?.tag else {
            return
        }
        let answer = currentAnswers[gestureTag]
        answersChosen.append(answer)
        nextQuestion()
    }
    
    // THIRD QUESTION
    @objc private func didTapButtonThirdQuestion(_ sender: UIButton) {
        let index = Int(round(slider.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            let answer = currentAnswers[index]
            answersChosen.append(answer)
        }
        nextQuestion()
    }
    
    // FOURTH QUESTION
    @objc private func didTapButtonFourthQuestion(_ sender: UIButton) {
        for (index, `switch`) in switchesFourthQuestion.enumerated() {
            if `switch`.isOn && index < currentAnswers.count {
                let answer = currentAnswers[index]
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    var answerFifthQuestion: Answer!
    // FIFTH QUESTION
    // didTapButtonFifthQuestion
    @objc private func didTapButtonFifthQuestion(_ sender: UIButton) {
        for button in buttonsFifthQuestion {
            button.isEnabled = false
        }
        
        let buttonsText: [Int : String] = {
            var buttonsText = [Int : String]()
            for (index, answer) in currentAnswers.enumerated() {
                buttonsText[index] = answer.text
            }
            return buttonsText
        }()
        
        if let buttonText = buttonsText[sender.tag] {
            sender.setTitle(buttonText, for: [])
            resultLabelFifthQuestion.text = "Твой секретный ингредиент: \(buttonText)"
        }
        sender.backgroundColor = UIColor(rgb: 0xDFFA00)
        
        answerFifthQuestion = currentAnswers[sender.tag]
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            questionLabel.text = nil
            stackViews[currentQuestion.tag].isHidden = true
            resultStackViewFifthQuestion.isHidden = false
        }
    }
    
    // RESULT FIFTH QUESTION
    // didTapButtonResultFifthQuestion
    @objc private func didTapButtonResultFifthQuestion(_ sender: UIButton) {
        if sender.tag == 1 {
            answersChosen.append(answerFifthQuestion)
        }
        nextQuestion()
    }
    
}






extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
