//
//  RatingView.swift
//  RatingViewApp
//
//  Created by Silvia Kuzmova on 27.01.22.
//

import UIKit

class RatingView: UIView {

    // MARK: - Constants

    private enum Constants {
        enum StarView {
            static let EmptyImage = UIImage(systemName: "star")
            static let SelectedImage = UIImage(systemName: "star.fill")
        }
    }

    // MARK: - Views

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        return stackView
    }()

    // MARK: - Getters & Setters

    var allStars: Int = 3 {
        didSet {
            createStarViews(count: allStars)
        }
    }

    var selectedStars: Int = 0 {
        didSet {
            selectStars(count: selectedStars)
        }
    }


    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupBindings()

        createStarViews(count: allStars)
        selectStars(count: selectedStars)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension RatingView {

    func setupViews() {
        backgroundColor = .white
        addSubview(stackView)
    }

    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    func setupBindings() {

    }

    func createStarViews(count: Int) {
        stackView.removeAllSubviews()
        for _ in 1...count {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = Constants.StarView.EmptyImage
            stackView.addArrangedSubview(imageView)
        }
    }

    func selectStars(count: Int) {
        for (index, starView) in stackView.arrangedSubviews.enumerated() {
            guard index < count else { return }
            guard let starView = starView as? UIImageView else { return }
            starView.image = UIImage(systemName: "star.fill")
        }
    }
}

extension UIView {
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
}


