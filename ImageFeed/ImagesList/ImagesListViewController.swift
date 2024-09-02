import UIKit

final class ImagesListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    // MARK: - Public Methods
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let posterImage = UIImage(named: photosName[indexPath.row]) else { return }
        
        cell.imageTab.image = posterImage
        cell.dateLabel.text = dateFormatter.string(from: Date())
        cell.likeButton.setTitle("", for: .normal)
        
        
        guard let like = UIImage(named: "active"), let nonLike = UIImage(named: "nonActive") else { return }
        if indexPath.row % 2 != 0 {
            cell.likeButton.setImage(nonLike, for: .normal)
        } else {
            cell.likeButton.setImage(like, for: .normal)
        }
    }
}


// MARK: - UITableViewDelegate
extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let posterImage = UIImage(named: photosName[indexPath.row]) else { return 0 }
        
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = posterImage.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = posterImage.size.height * scale + imageInsets.top + imageInsets.bottom
        
        return cellHeight
    }
}

// MARK: - UITableViewDataSource
extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        
        return imageListCell
    }
}