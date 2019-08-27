//
//  KingfishserViewController.swift
//  MemoryIssue
//
//  Created by Shivam Pokhriyal on 27/08/19.
//

import UIKit
import Kingfisher
import SDWebImage

class KingfishserViewController: UIViewController {

    let placeholder = UIImage(named: "placeholder", in: Bundle.main, compatibleWith: nil)
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
            ])
    }

    func showImage() {
        if useKingfisher {
            let processor = DownsamplingImageProcessor(size: imageView.intrinsicContentSize)
            imageView.kf.setImage(with: url, placeholder: placeholder, options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
                ])
        } else {
            imageView.sd_setImage(with: url, placeholderImage: placeholder, options: SDWebImageOptions.refreshCached, context: nil)
        }
    }

}
