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
        let questionLabel = UILabel()
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 2
        
        return questionLabel
    }()
    // progressLine
    private let progressLine: UIProgressView = {
        let progressLine = UIProgressView()
        
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        
        return progressLine
    }()
    // general stackViews
    private let stackViews: [UIStackView] = {
        let stackViewSingleButtons = UIStackView()
        let stackViewSingleImages = UIStackView()
        let stackViewRange = UIStackView()
        let stackViewMultiply = UIStackView()
        let stackViewToggleButtons = UIStackView()
        
        let stackViews = [
            stackViewSingleButtons, stackViewSingleImages,
            stackViewRange, stackViewMultiply,
            stackViewToggleButtons,
        ]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .equalSpacing
            stackView.tag = index
            
            switch stackView {
            case stackViewSingleButtons:
                stackView.spacing = 0
                stackView.axis = .vertical
            default:
                stackView.spacing = SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918
                stackView.axis = .vertical
            }
        }
        
        return stackViews
    }()
    
    // MARK: - UIProperties SINGLE BUTTONS
    // buttonsSingleButtons
    private let buttonsSingleButtons: [UIButton] = {
        let firstButton = UIButton()
        let secondButton = UIButton()
        let thirdButton = UIButton()
        let forthButton = UIButton()
        
        let buttons = [firstButton, secondButton, thirdButton, forthButton]
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.systemBlue, for: .normal)
            button.tag = index
        }
        
        return buttons
    }()
    
    // MARK: - UIProperties SINGLE IMAGES
    // stackViewsImageViewsSingleImages
    private let stackViewsImageViewsSingleImages: [UIStackView] = {
        let topStackView = UIStackView()
        let bottomStackView = UIStackView()
        
        let stackViews = [topStackView, bottomStackView]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.spacing = SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.tag = index
        }
        
        return stackViews
    }()
    // imageViewsSingleImages
    private let imageViewsSingleImages: [UIImageView] = {
        let topLeftImageView = UIImageView()
        let topRightImageView = UIImageView()
        let bottomLeftImageView = UIImageView()
        let bottomRightImageView = UIImageView()
        
        let imageViews = [topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView]
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.isUserInteractionEnabled = true
            imageView.tag = index
        }
        
        return imageViews
    }()
    
    // MARK: - UIProperties RANGE
    // stackViewsRange
    private var stackViewsRange: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .equalSpacing
            stackView.tag = index
        }
        
        return stackViews
    }()
    // imageViewsRange
    private let imageViewsRange: [UIImageView] = {
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
    // sliderRange
    private let sliderRange: UISlider = {
        let slider = UISlider()
        return slider
    }()
    // labelsRange
    private let labelsRange: [UILabel] = {
        let leftLabel = UILabel()
        let rightLabel = UILabel()
        
        let labels = [leftLabel, rightLabel]
        
        for (index, label) in labels.enumerated() {
            label.textColor = .black
            label.sizeToFit()
            label.tag = index
        }
        
        return labels
    }()
    // buttonRange
    private let buttonRange: UIButton = {
        let button = UIButton()
        
        button.setTitle("Ответить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    // MARK: - UIProperties MULTIPLY
    // generalStackViewMultiply
    private let generalStackViewMultiply: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    // stackViewsMultiply
    private let stackViewsMultiply: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .equalSpacing
            stackView.tag = index
        }
        
        return stackViews
    }()
    // labelsMultiply
    private let labelsMultiply: [UILabel] = {
        let firstLabel = UILabel()
        let secondLabel = UILabel()
        let thirdLabel = UILabel()
        let fourthLabel = UILabel()
        
        let labels = [firstLabel, secondLabel, thirdLabel, fourthLabel]
        
        for (index, label) in labels.enumerated() {
            label.textColor = .black
            label.sizeToFit()
            label.tag = index
        }
        
        return labels
    }()
    // switchesMultiply
    private let switchesMultiply: [UISwitch] = {
        let firstSwitch = UISwitch()
        let secondSwitch = UISwitch()
        let thirdSwitch = UISwitch()
        let fourthSwitch = UISwitch()

        let switches = [firstSwitch, secondSwitch, thirdSwitch, fourthSwitch]
        
        for `switch` in switches {
            `switch`.isOn = false
        }
        
        return switches
    }()
    // buttonMultiply
    private let buttonMultiply: UIButton = {
        let button = UIButton()
        
        button.setTitle("Ответить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
            
        return button
    }()
    
    // MARK: - UIProperties TOGGLEBUTTONS
    // verticalStackViewsToggleButtons
    private let verticalStackViewsToggleButtons: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()

        let stackViews = [firstStackView, secondStackView]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.spacing = SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.tag = index
        }
        
        return stackViews
    }()
    // horizontalStackViewsToggleButtons
    private let horizontalStackViewsToggleButtons: [UIStackView] = {
        let firstStackView = UIStackView()
        let secondStackView = UIStackView()
        let thirdStackView = UIStackView()
        let fourthStackView = UIStackView()
        
        let stackViews = [firstStackView, secondStackView, thirdStackView, fourthStackView]
        
        for (index, stackView) in stackViews.enumerated() {
            stackView.spacing = SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.tag = index
        }
        
        return stackViews
    }()
    // buttonsToggleButtons
    private let buttonsToggleButtons: [UIButton] = {
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
            button.backgroundColor = UIColor(rgb: 0x91A200)
            button.tag = index
        }
        
        return buttons
    }()
    
    // MARK: - UIProperties RESULT TOGGLE BUTTONS
    // resultStackViewToggleButtons
    private let resultStackViewToggleButtons: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    // resultLabelStackViewToggleButtons
    private let resultLabelStackViewToggleButtons: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    // resultInnerStackViewToggleButtons
    private let resultInnerStackViewToggleButtons: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        return stackView
    }()
    // resultLabelToggleButtons
    private let resultLabelToggleButtons: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    // resultQuestionLabelToggleButtons
    private let resultQuestionLabelToggleButtons: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Будем готовить ?"
        
        return label
    }()
    // resultButtonsToggleButtons
    private let resultButtonsToggleButtons: [UIButton] = {
        let leftButton = UIButton()
        let rightButton = UIButton()
        
        let buttons = [leftButton, rightButton]
        
        let labelNames: [Int : String] = [0 : "НЕТ 🤢", 1 : "ДА 🔥"]
                
        for (index, button) in buttons.enumerated() {
            button.tag = index
            button.setTitle(labelNames[button.tag], for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
        }
        
        return buttons
    }()

    
    // MARK: - Propeties
    private var answersChosen = [Answer]()
    private var appendAnswer: Answer!
    private var currentAnswers: [Answer] { Question.all[questionIndex].answers }
    private var currentQuestion: Question { Question.all[questionIndex] }
    private var questionIndex = 0
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view
        view.backgroundColor = .white
        
        // GENERAL
        for index in Question.all.indices {
            if Question.all[index].isShuffled {
                Question.all[index].answers = Question.all[index].answers.shuffled()
            }
        }
        Question.all = Question.all.shuffled()
        // questionLabel
        view.addSubview(questionLabel)
        // progressLine
        view.addSubview(progressLine)
        // stackViews
        for stackView in stackViews {
            view.addSubview(stackView)
            switch stackView.tag {
            case 0:
                // SINGLE BUTTONS
                addElementsSingleButtons(stackView: stackView)
            case 1:
                // SINGLE IMAGES
                addElemetnsSingleImages(stackView: stackView)
            case 2:
                // RANGE
                addElementsRange(stackView: stackView)
            case 3:
                // MULTIPLY
                addElementsMultiply(stackView: stackView)
            case 4:
                // TOGGLE BUTTONS
                addElementsToggleButtons(stackView: stackView)
                // RESULT TOGGLE BUTTONS
                addElementsResultToggleButtons()
            default:
                print("error")
            }
        }
        // resultStackViewToggleButtons
        view.addSubview(resultStackViewToggleButtons)
        
        addConstraints()
        updateUI()
    }
    
    // update User Interface
    func updateUI() {
        func updateSingleButtonsStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for (button, answer) in zip(buttonsSingleButtons, currentAnswers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateSingleImagesStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for (image, answer) in zip(imageViewsSingleImages, currentAnswers) {
                if let imageName = answer.image {
                    image.image = UIImage(named: imageName)
                }
            }
        }
        
        func updateRangeStack() {
            stackViews[currentQuestion.tag].isHidden = false
            labelsRange.first?.text = currentAnswers.first?.text
            labelsRange.last?.text = currentAnswers.last?.text
        }
        
        func updateMultiplyStack() {
            stackViews[currentQuestion.tag].isHidden = false
            for (label, answer) in zip(labelsMultiply, currentAnswers) {
                label.text = answer.text
            }
        }
        
        func updateToggleButtonsStack() {
            let size = UIScreen.main.bounds
            stackViews[currentQuestion.tag].axis = size.height < size.width ? .horizontal : .vertical
            stackViews[currentQuestion.tag].isHidden = false
            for button in buttonsToggleButtons {
                button.setTitle("?", for: [])
            }
        }
        
        for stackView in stackViews {
            stackView.isHidden = true
        }
        resultStackViewToggleButtons.isHidden = true

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
        questionIndex += 1
        if questionIndex < Question.all.count {
            updateUI()
        } else {
            let vc = ResultsViewController()
            vc.answers = answersChosen
            
            questionIndex = 0
            answersChosen = []
            
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
        constraints.append(questionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        constraints.append(questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        constraints.append(questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0))
        // progressLine
        constraints.append(progressLine.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        constraints.append(progressLine.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        constraints.append(progressLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
        // stackViews
        for stackView in stackViews {
            constraints.append(stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
            constraints.append(stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        }
        
        // SINGLE BUTTONS
        // buttonsSingleButtons
        for button in buttonsSingleButtons {
            constraints.append(button.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.height) * 0.058))
        }

        // SINGLE IMAGES
        // imageViewsSingleImages
        for imageView in imageViewsSingleImages {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.25))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.25))
        }
        
        // RANGE
        // stackViewsRange
        for innerStackView in stackViewsRange {
            constraints.append(innerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
            constraints.append(innerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
        }
        // imageViewsRange
        for imageView in imageViewsRange {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.15))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.15))
        }
        
        // MULTIPLY
        // generalStackViewMultiply
        constraints.append(generalStackViewMultiply.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
        constraints.append(generalStackViewMultiply.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
        
        // TOGGLE BUTTONS
        // buttonsToggleButtons
        for button in buttonsToggleButtons {
            constraints.append(button.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.height) * 0.12))
            constraints.append(button.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.height) * 0.12))
        }
        
        // RESULT TOGGLE BUTTONS
        // resultStackViewToggleButtons
        constraints.append(resultStackViewToggleButtons.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        constraints.append(resultStackViewToggleButtons.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
        constraints.append(resultStackViewToggleButtons.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.04830918))
        
        
        // Activate
        NSLayoutConstraint.activate(constraints)
        
        addSize()
    }
    
    // Add correct size
    private func addSize() {
        // GENERAL
        guard let coefficient = SizeScreen.size.height / SizeScreen.size.width < 2 && SizeScreen.size.height / SizeScreen.size.width > 0.5 ? 35 : 25 else {
            return
        }
        // navigationController
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black , NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeScreen.giveFactor() / CGFloat(coefficient))]
        // questionLabel
        questionLabel.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        
        // SINGLE BUTTONS
        // buttonsSingleButtons
        for button in buttonsSingleButtons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        }
        
        // RANGE
        // labelsRange
        for label in labelsRange {
            label.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 19)
        }
        // buttonRange
        buttonRange.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        
        // MULTIPLY
        // labelsMultiply
        for label in labelsMultiply {
            label.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 19)
        }
        // switchesMultiply
        for `switch` in switchesMultiply {
            `switch`.transform = CGAffineTransform(scaleX: SizeScreen.giveFactor() / 500, y: SizeScreen.giveFactor() / 500)
        }
        // buttonMultiply
        buttonMultiply.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        
        // TOGGLE BUTTONS
        // buttonsToggleButtons
        for button in buttonsToggleButtons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 10)
        }
        
        // RESULT TOGGLE BUTTONS
        // resultLabelToggleButtons
        resultLabelToggleButtons.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        // resultQuestionLabelToggleButtons
        resultQuestionLabelToggleButtons.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        // resultButtonsToggleButtons
        for button in resultButtonsToggleButtons {
            button.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
        }
    }
    
    // MARK: - Add Views in StackViews
    // SINGLE BUTTONS
    private func addElementsSingleButtons(stackView: UIStackView) {
        // buttonsSingleButtons
        for button in buttonsSingleButtons {
            stackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(didTapButtonSingleButtons), for: .touchUpInside)
        }
    }
    
    // SINGLE IMAGES
    private func addElemetnsSingleImages(stackView: UIStackView) {
        for (index, stackViewImageView) in stackViewsImageViewsSingleImages.enumerated() {
            // stackViewsImageViewsSingleImages
            stackView.addArrangedSubview(stackViewImageView)
            for imageView in imageViewsSingleImages {
                switch imageView.tag {
                // imageViewsSingleImages
                case ..<Int(imageViewsSingleImages.count / 2):
                    if index < stackViewsImageViewsSingleImages.count / 2 {
                        stackViewImageView.addArrangedSubview(imageView)
                    }
                case Int(imageViewsSingleImages.count / 2)...:
                    if index >= stackViewsImageViewsSingleImages.count / 2 {
                        stackViewImageView.addArrangedSubview(imageView)
                    }
                default:
                    print("error")
                }
                
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSingleImages(_:)))
                imageView.addGestureRecognizer(tapGesture)
            }
        }
    }
    
    // RANGE
    private func addElementsRange(stackView: UIStackView) {
        for innerStackView in stackViewsRange {
            // stackViewsRange
            stackView.addArrangedSubview(innerStackView)
            switch innerStackView.tag {
            case 0:
                // imageViewsRange
                for imageView in imageViewsRange {
                    innerStackView.addArrangedSubview(imageView)
                }
            case 1:
                // sliderRange
                innerStackView.addArrangedSubview(sliderRange)
            case 2:
                // labelsRange
                for label in labelsRange {
                    innerStackView.addArrangedSubview(label)
                }
            case 3:
                // buttonRange
                innerStackView.addArrangedSubview(buttonRange)
                buttonRange.addTarget(self, action: #selector(didTapButtonRange), for: .touchUpInside)
            default:
                print("error")
            }
        }
    }
    
    // MULTIPLY
    private func addElementsMultiply(stackView: UIStackView) {
        stackView.addArrangedSubview(generalStackViewMultiply)
        for (index, innerStackView) in stackViewsMultiply.enumerated() {
            // generalStackViewMultiply
            generalStackViewMultiply.addArrangedSubview(innerStackView)
            // labelsMultiply, switchesMultiply
            if labelsMultiply.indices.contains(index), switchesMultiply.indices.contains(index) {
                innerStackView.addArrangedSubview(labelsMultiply[index])
                innerStackView.addArrangedSubview(switchesMultiply[index])
            }
        }
        // buttonMultiply
        stackView.addArrangedSubview(buttonMultiply)
        buttonMultiply.addTarget(self, action: #selector(didTapButtonMultiply), for: .touchUpInside)
    }
    
    // TOGGLE BUTTON
    private func addElementsToggleButtons(stackView: UIStackView) {
        for innerStackView in verticalStackViewsToggleButtons {
            // verticalStackViewsToggleButtons
            stackView.addArrangedSubview(innerStackView)
            // horizontalStackViewsToggleButtons
            for horizontalInnerStackView in horizontalStackViewsToggleButtons {
                if innerStackView.tag % 2 == 0, horizontalInnerStackView.tag % 2 == 0 {
                    innerStackView.addArrangedSubview(horizontalInnerStackView)
                } else if innerStackView.tag % 2 != 0, horizontalInnerStackView.tag % 2 != 0{
                    innerStackView.addArrangedSubview(horizontalInnerStackView)
                }
            }
        }
        // buttonsToggleButtons
        for (index, horizontalInnerStackView) in horizontalStackViewsToggleButtons.enumerated() {
            for button in buttonsToggleButtons {
                switch button.tag {
                case ..<Int(buttonsToggleButtons.count / 4):
                    if index < horizontalStackViewsToggleButtons.count / 4 {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsToggleButtons.count / 4)..<Int(buttonsToggleButtons.count / 2):
                    if index >= horizontalStackViewsToggleButtons.count / 4, index < horizontalStackViewsToggleButtons.count / 2 {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsToggleButtons.count / 2)..<Int(buttonsToggleButtons.count - buttonsToggleButtons.count / 4):
                    if index >= horizontalStackViewsToggleButtons.count / 2, index < (horizontalStackViewsToggleButtons.count - horizontalStackViewsToggleButtons.count / 4) {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                case Int(buttonsToggleButtons.count - buttonsToggleButtons.count / 4)..<Int(buttonsToggleButtons.count):
                    if index >= (horizontalStackViewsToggleButtons.count - horizontalStackViewsToggleButtons.count / 4), index < (horizontalStackViewsToggleButtons.count) {
                        horizontalInnerStackView.addArrangedSubview(button)
                    }
                default:
                    print("error")
                }
                button.addTarget(self, action: #selector(didTapButtonToogleButtons), for: .touchUpInside)
            }
        }
    }
    
    // RESULT TOOGLE BUTTONS
    private func addElementsResultToggleButtons() {
        // resultStackViewToggleButtons
        resultStackViewToggleButtons.addArrangedSubview(resultLabelStackViewToggleButtons)
        // resultLabelStackViewToggleButtons
        resultLabelStackViewToggleButtons.addArrangedSubview(resultLabelToggleButtons)
        // resultLabelStackViewToggleButtons
        resultLabelStackViewToggleButtons.addArrangedSubview(resultQuestionLabelToggleButtons)
        // resultStackViewToggleButtons
        resultStackViewToggleButtons.addArrangedSubview(resultInnerStackViewToggleButtons)
        // resultButtonsToggleButtons
        for button in resultButtonsToggleButtons {
            resultInnerStackViewToggleButtons.addArrangedSubview(button)
        button.addTarget(self, action: #selector(didTapButtonResultToggleButtons), for: .touchUpInside)
        }
    }
    
    // MARK: - Actions
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if currentQuestion.type == .toggleButtons {
            stackViews[currentQuestion.tag].axis = size.height < size.width ? .horizontal : .vertical
        }
    }
    
    // SINGLE BUTTONS
    @objc private func didTapButtonSingleButtons(_ sender: UIButton) {
        appendAnswer = currentAnswers[sender.tag]
        answersChosen.append(appendAnswer)
        nextQuestion()
    }
    
    // SINGLE IMAGES
    @objc private func didTapSingleImages(_ gesture: UITapGestureRecognizer) {
        guard let gestureTag = gesture.view?.tag else { return }
        appendAnswer = currentAnswers[gestureTag]
        answersChosen.append(appendAnswer)
        nextQuestion()
    }
    
    // RANGE
    @objc private func didTapButtonRange(_ sender: UIButton) {
        let index = Int(round(sliderRange.value * Float(currentAnswers.count - 1)))
        if index < currentAnswers.count {
            appendAnswer = currentAnswers[index]
            answersChosen.append(appendAnswer)
        }
        nextQuestion()
    }
    
    // MULTIPLY
    @objc private func didTapButtonMultiply(_ sender: UIButton) {
        for (index, `switch`) in switchesMultiply.enumerated() {
            if `switch`.isOn && index < currentAnswers.count {
                appendAnswer = currentAnswers[index]
                answersChosen.append(appendAnswer)
            }
        }
        nextQuestion()
    }
    
    // TOGGLE BUTTONS
    @objc private func didTapButtonToogleButtons(_ sender: UIButton) {
        for button in buttonsToggleButtons {
            button.isEnabled = false
        }
        
        sender.setTitle(currentAnswers[sender.tag].text, for: [])
        resultLabelToggleButtons.text = "Твой секретный ингредиент: \(sender.currentTitle!)"
        sender.backgroundColor = UIColor(rgb: 0xDFFA00)
        
        appendAnswer = currentAnswers[sender.tag]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            questionLabel.text = nil
            stackViews[currentQuestion.tag].isHidden = true
            resultStackViewToggleButtons.isHidden = false
        }
    }
    
    // RESULT TOGGLE BUTTONS
    @objc private func didTapButtonResultToggleButtons(_ sender: UIButton) {
        if sender.tag == 1 { answersChosen.append(appendAnswer) }
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
