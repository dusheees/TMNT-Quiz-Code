//
//  ViewController.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 21.11.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - UIProperties
    // button
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.5,
            .strokeColor: UIColor.white,
        ]
        let attributedString = NSAttributedString(string: "Начать Quiz", attributes: attributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    // imageViews
    private let imageViews: [UIImageView] = {
        let topLeftImageView = UIImageView()
        let topRightImageView = UIImageView()
        let bottomLeftImageView = UIImageView()
        let bottomRightImageView = UIImageView()
        
        let imageViews = [topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView]
        
        let imageNames: [Int : String] = [
            0 : "donatello@x1",
            1 : "leonardo@x1",
            2 : "michaelangelo@x1",
            3 : "raphael@x1",
        ]
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.tag = index
            imageView.translatesAutoresizingMaskIntoConstraints = false
            if let imageName = imageNames[imageView.tag] {
                imageView.image = UIImage(named:  imageName)
            }
        }
        
        return imageViews
    }()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button
        view.backgroundColor = .white
        view.addSubview(button)
        
        // images
        for imageView in imageViews {
            view.addSubview(imageView)
        }
        
        addConstraints()
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        // Add
        // button
        constraints.append(button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        constraints.append(button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        constraints.append(button.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.height) * 0.058))
        constraints.append(button.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.362))
        
        // imageViews
        for imageView in imageViews {
            constraints.append(imageView.heightAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.35))
            constraints.append(imageView.widthAnchor.constraint(equalToConstant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.35))
            switch imageView.tag {
            case 0:
                constraints.append(imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
                constraints.append(imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
            case 1:
                constraints.append(imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
                constraints.append(imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
            case 2:
                constraints.append(imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
                constraints.append(imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
            case 3:
                constraints.append(imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
                constraints.append(imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -SizeScreen.sizeWidthHeight(SizeScreen.size.width) * 0.0625))
            default:
                print("error")
            }
            addSize()
        }
        
        // Activate
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addSize() {
        // button
        button.titleLabel?.font = UIFont.systemFont(ofSize: SizeScreen.giveFactor() / 16)
    }
    
    // MARK: - Actions
    @objc private func didTapButton() {
        let rootVc = QuestionsViewController()
        let navVc = UINavigationController(rootViewController: rootVc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
    }
    
}
