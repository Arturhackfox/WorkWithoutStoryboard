//
//  ViewController.swift
//  WorkWithoutStoryboard
//
//  Created by Arthur Sh on 24.01.2024.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // This initialiser will be called if an instance of your view is used in a storyboard scene.
    required init?(coder: NSCoder) {
        fatalError()
    }
}


class ViewController: UIViewController {
    
    // MARK: - Constant
    private enum Constants {
        
    }
    
    // MARK: - UI
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        var config = UIButton.Configuration.gray()
        config.title = "tap me"
        config.baseForegroundColor = .yellow
        config.image = UIImage(systemName: "heart")
        config.imagePadding = 5
        config.imagePlacement = .leading
        config.cornerStyle = .capsule
        //        config.baseBackgroundColor = .systemGray
        
        button.configuration = config
        
        button.translatesAutoresizingMaskIntoConstraints = false // без false -> констрейнты не будут работать
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(systemName: "globe")
        let imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello guys"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textColor = .blue
        label.backgroundColor = .red
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here.."
        textField.backgroundColor = .cyan
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 3
        textField.layer.borderColor = UIColor.yellow.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // MARK: Inits
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        // использовать если нужно подменить базовую вью от viewController.
        //  view = MyCustomView()
        view = CustomView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        view.backgroundColor = .systemGreen
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        createGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
    
    deinit {
        print("Vc1 deinited")
    }
    
    // MARK: - Setups
    
    private func createGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(gesture)
    }
    
    private func setupView() {
        // настройка базового view
    }
    
    private func setupHierarchy() {
        //view.addSubview(someView)
        view.addSubview(textField)
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(label)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            imageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            textField.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -50),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonTapped() {
        let nextVC = NextViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print("button tapped!")
    }
    
    @objc
    private func viewTapped() {
        view.endEditing(true)
    }
    
}

