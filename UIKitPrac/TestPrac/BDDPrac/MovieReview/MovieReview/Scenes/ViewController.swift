//
//  ViewController.swift
//  MovieReview
//
//  Created by SUCHAN CHANG on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieSearchManager().request(form: "Starwars") { movies in
            print(movies)
        }
    }
}
