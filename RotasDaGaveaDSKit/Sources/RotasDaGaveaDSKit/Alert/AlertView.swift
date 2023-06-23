//
//  FeedbackAlertView.swift
//  valedagavea
//
//  Created by caiomadeira on 20/06/23.
//

import UIKit

class AlertView: UIView {
    
    var title: String?
    var message: String?
    var height: CGFloat = 250
    var width: CGFloat = 350
    var style: ViewControllerType
    
    private lazy var dimmedView: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var containerView: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var headerView: UIView = {
       let view = UIView()
        return view
    }()
    
    private lazy var imageView: UIImageView = {
       let view = UIImageView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
       let label = UILabel()
        return label
    }()

    init(title: String, message: String, style: ViewControllerType) {
        self.title = title
        self.message = message
        self.style = style
        super.init(frame: .zero)
        setupAlertStyle()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAlertStyle() {
        switch (style) {
        case .alert(.feedback):
            
            titleLabel.text = title
            messageLabel.text = message
            headerView.backgroundColor = .blue
            imageView.image = UIImage(named: "icon-pin")?.withRenderingMode(.alwaysOriginal)
            
        case .alert(.warning):
            
            messageLabel.text = message
            titleLabel.text = title
            headerView.backgroundColor = .lightYellow
            imageView.image = UIImage(named: "icon-line")?.withRenderingMode(.alwaysOriginal)

        case .alert(.error(Errors.generic)):
            
            messageLabel.text = message
            titleLabel.text = title
            headerView.backgroundColor = .red
            imageView.image = UIImage(named: "icon-play")?.withRenderingMode(.alwaysOriginal)

        default:
            break;
        }
    }
}

extension AlertView: ViewCode {
    func setupHierarchy() {
        addSubview(dimmedView)
        addSubview(containerView)
        containerView.addSubview(headerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(messageLabel)
    }
    
    func setupConfiguration() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        
        dimmedView.backgroundColor = .black
        dimmedView.alpha = 0.5
                
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = .alternativeBlack
        titleLabel.font = UIFont(name: "Arial", size: 20.0)
                
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 2
        messageLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Arial", size: 18.0)
    }
    
    func setupConstraints() {
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.heightAnchor.constraint(equalToConstant: 250),
            self.widthAnchor.constraint(equalToConstant: 350),
            
            dimmedView.topAnchor.constraint(equalTo: self.topAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: height),
            containerView.widthAnchor.constraint(equalToConstant: width),
            
            headerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            headerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            headerView.heightAnchor.constraint(equalToConstant: (height / 2) + 40),
            headerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -200),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 120),
        ])
    }
    
    func setupAcessibility() { }
}
