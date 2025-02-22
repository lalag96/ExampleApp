//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let helper = Helper()
	
	private let textLabel = UILabel()
	private let imageView = UIImageView()
	private let imageContainerView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
		setupImageView()
		setupImage()
		view.addSubview(textLabel)
		view.addSubview(imageContainerView)
		setupView()
		setupLayout()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
		textLabel.textColor = .red
	}
	
	private func setupImageView() {
			// Настройка контейнера для изображения
		imageContainerView.layer.cornerRadius = 20
		imageContainerView.layer.shadowColor = UIColor.black.cgColor
		imageContainerView.layer.shadowOpacity = 0.7
		imageContainerView.layer.shadowOffset = CGSize(width: 5, height: 5)
		imageContainerView.layer.shadowRadius = 10
	}
	
	private func setupImage() {
			// Добавление изображения в контейнер
		imageView.image = UIImage(named: "raccoon")
        imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 20
		imageView.clipsToBounds = true
		
			// Добавляем imageView в контейнер
		imageContainerView.addSubview(imageView)
	}
	
	private func setupView() {
		let gradient = CAGradientLayer()
		gradient.frame = view.bounds
		gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1, y: 1)
		
		// Добавляем подслой к супервью
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне супервью
	}
	
	private func setupLayout() {
		textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
        
        NSLayoutConstraint.activate([
            imageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200)
            ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor)
        ])
            
	}
}

