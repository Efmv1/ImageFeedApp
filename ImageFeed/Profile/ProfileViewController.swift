import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Private Properties
    private var imageView: UIImageView = {
        let image = UIImage(named: "profilePhoto")
        let view = UIImageView(image: image)
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Екатерина Новикова"
        label.textColor = .ypWhite
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
    private var nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "@ekaterina_nov"
        label.textColor = .ypGray
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.textColor = .ypWhite
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        presentProfilePhoto()
        
    }
    
    // MARK: - Private Methods
    private func presentProfilePhoto() {
        [imageView, nameLabel, nicknameLabel, statusLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            
            nicknameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nicknameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            
            statusLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            statusLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 8)
        ])
        
        let exitButton = UIButton.systemButton(with: UIImage(named: "exitPicture") ?? UIImage(),
                                               target: self,
                                               action: #selector(didExitButtonTaped))
        exitButton.tintColor = .ypRed
        
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        exitButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc private func didExitButtonTaped() {
        for view in view.subviews {
            if view is UILabel {
                view.removeFromSuperview()
            }
        }
        
        imageView.image = UIImage(named: "stub")
    }
}
