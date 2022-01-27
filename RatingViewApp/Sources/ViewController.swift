//
//  ViewController.swift
//  RatingViewApp
//
//  Created by Silvia Kuzmova on 27.01.22.
//

import UIKit

class ViewController: UIViewController {

    private let movieRatingView: RatingView = {
        let ratingView = RatingView()
        ratingView.allStars = 5
        ratingView.selectedStars = 1
        return ratingView
    }()

    private let foodRatingView: RatingView = {
        let ratingView = RatingView()
        ratingView.allStars = 3
        ratingView.selectedStars = 7
        return ratingView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .systemPink

        view.addSubview(movieRatingView)
        view.addSubview(foodRatingView)


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


}

