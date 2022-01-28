//
//  ViewController.swift
//  RatingViewApp
//
//  Created by Silvia Kuzmova on 27.01.22.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var subscriptions: Set<AnyCancellable> = []

    private let movieRatingView: RatingView = {
        let ratingView = RatingView(allStars: 5, selectedStars: 3)
        return ratingView
    }()

    private let foodRatingView: RatingView = {
        let ratingView = RatingView()
        ratingView.selectedStars = 7
        return ratingView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        setupBindings()

        movieRatingView.selectedStars = 2
    }
}

private extension ViewController {

    func setupViews() {
        view.backgroundColor = .white

        view.addSubview(movieRatingView)
        view.addSubview(foodRatingView)
    }

    func setupConstraints() {
        movieRatingView.translatesAutoresizingMaskIntoConstraints = false
        movieRatingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        movieRatingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        movieRatingView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        movieRatingView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        foodRatingView.translatesAutoresizingMaskIntoConstraints = false
        foodRatingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        foodRatingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        foodRatingView.topAnchor.constraint(equalTo: movieRatingView.bottomAnchor, constant: 200).isActive = true
        foodRatingView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupBindings() {
        movieRatingView.ratingHasChangedPublisher
            .sink { rank in
                print("⭐️ ranking has changed to: \(rank)")
            }
            .store(in: &subscriptions)
    }
}

