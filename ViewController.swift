//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Zachary Meisner on 3/12/22.
//

import UIKit

class ViewController: UIViewController {
    // create function imageView
    private let imageView: UIImageView = {let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // create function for button
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    // create array of random colors
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemGreen,
        .systemYellow,
        .systemPurple,
        .systemOrange]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // adds background color
        view.backgroundColor = .systemPink
        // adds different view then background
        view.addSubview(imageView)
        // dictates imageView and what it looks like on the application
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        // adding a subview for button
        view.addSubview(button)
        // creates frame
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    // have to add @objc target for button to work and then call function
    @objc func didTapButton() {
        getRandomPhoto()
        
        // every time the button is clicked the screen changes a random color
        view.backgroundColor = colors.randomElement()
    }
    
    
    
    // overriding the function for the buttom to move the button up
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            button.frame = CGRect(
                x: 20,
                y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                width: view.frame.size.width-60,
                height: 55
            )
    }
    
    // create function
    func getRandomPhoto() {
        // calls urlString
        let urlString = "https://source.unsplash.com/random/600x600"
        // tells the application that we know that this website exists with the ! after urlString
        let url = URL(string: urlString)!
        // let the application pull data in and says try to get data
        guard let data = try?
        // try to get this data
            Data(contentsOf: url) else {
            return
        }
        // tells application what the image is to put into the function call
        imageView.image = UIImage(data: data)
    }
}
