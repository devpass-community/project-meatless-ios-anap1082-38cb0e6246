import UIKit

class HeaderView: UIView {
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 25
        logoImageView.layer.masksToBounds = true
        logoImageView.image = UIImage(named: "placeholder")
        return logoImageView
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let restaurantNameLabel = UILabel()
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.font = UIFont.boldSystemFont(ofSize: 15)
        restaurantNameLabel.text = "Name"
        return restaurantNameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.boldSystemFont(ofSize: 12)
        statusLabel.text = "Delivery"
        statusLabel.textColor = .gray
        return statusLabel
    }()
    
    lazy var restaurantInfoLabel: UILabel = {
        let restaurantInfoLabel = UILabel()
        restaurantInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantInfoLabel.font = UIFont.boldSystemFont(ofSize: 12)
        restaurantInfoLabel.text = "Information"
        restaurantInfoLabel.textColor = .gray
        return restaurantInfoLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    
    func setupViews() {
        
        configureSubViews()
        configureSubViewsConstraints()
    }
    
    func configureSubViews() {
        
        addSubview(logoImageView)
        addSubview(restaurantNameLabel)
        addSubview(statusLabel)
        addSubview(restaurantInfoLabel)
    }
    
    func configureSubViewsConstraints() {
        
        NSLayoutConstraint.activate([
            
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
        
            restaurantNameLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 66),
            restaurantNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            
            statusLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 66),
            statusLabel.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 3),

            restaurantInfoLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 66),
            restaurantInfoLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 3)
            
        
        ])
    }
    
    func updateView(restaurant: Restaurant) {
        logoImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        statusLabel.text = restaurant.status
        restaurantInfoLabel.text = restaurant.openDays
    }
}
