//
//  KingfishserViewController.swift
//  MemoryIssue
//
//  Created by Shivam Pokhriyal on 27/08/19.
//

import UIKit
import Kingfisher
import SDWebImage

class ImageViewController: UIViewController {

    let placeholder = UIImage(named: "placeholder", in: Bundle.main, compatibleWith: nil)
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "close", in: Bundle.main, compatibleWith: nil), for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        return button
    }()

    let url: URL
    let useKingfisher: Bool

    init(url: URL, useKingfisher: Bool) {
        self.url = url
        self.useKingfisher = useKingfisher
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(closeButton)

        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),

            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    @objc func tapped() {
        dismiss(animated: true, completion: nil)
    }

    func showImage() {
        if useKingfisher {
            imageView.kf.setImage(with: url, placeholder: placeholder)
        } else {
            imageView.sd_setImage(with: url, placeholderImage: placeholder, options: SDWebImageOptions.refreshCached, context: nil)
        }
    }

}
