//
//  RatingView.swift
//  RatingViewApp
//
//  Created by Silvia Kuzmova on 27.01.22.
//

import UIKit
import Combine

class RatingView: UIView {

    // MARK: - Constants

    private enum Constants {
        enum StarView {
            static let EmptyImage = UIImage(systemName: "star")
            static let SelectedImage = UIImage(systemName: "star.fill")
        }

        static let maxStarCount = 10
        static let minStarCount = 3
    }

    // MARK: - Combine

    private lazy var ratingHasChangedSubject = PassthroughSubject<Int, Never>()
    private(set) lazy var ratingHasChangedPublisher = ratingHasChangedSubject
        .eraseToAnyPublisher()

    // MARK: - Views

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fillEqually
        return stackView
    }()

    // MARK: - Getters & Setters

    private(set) var allStars: Int = 3 {
        didSet {
            createStarViews(count: allStars)
        }
    }

    var selectedStars: Int = 0 {
        didSet {
            selectStars(count: selectedStars)
            ratingHasChangedSubject.send(selectedStars)
        }
    }


    // MARK: - Init

    init(allStars: Int = 3, selectedStars: Int = 0) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupBindings()

        // set min to 3 and max to 10
        if allStars < Constants.minStarCount {
            self.allStars = Constants.minStarCount
        } else if allStars > Constants.maxStarCount {
            self.allStars = Constants.maxStarCount
        } else {
            self.allStars = allStars
        }
        self.selectedStars = selectedStars

        createStarViews(count: self.allStars)
        selectStars(count: self.selectedStars)
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



