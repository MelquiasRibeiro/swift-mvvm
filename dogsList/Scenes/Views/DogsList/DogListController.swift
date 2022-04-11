
import UIKit

class DogListController: UIViewController {
    
    // MARK: - Properties
    var dogListViewModel = DogListViewModel()
    
    lazy var dogsList:UITableView = {
        let dogsList = UITableView(frame: .zero,style: .plain)
        dogsList.translatesAutoresizingMaskIntoConstraints = false
        dogsList.delegate = self
        dogsList.dataSource = self
        dogsList.backgroundColor = .white
        dogsList.separatorStyle = .none
        dogsList.rowHeight = 100
        dogsList.register(DogsTableViewCell.self, forCellReuseIdentifier: DogsTableViewCell.identifier)
       return dogsList
    }()
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.dogListViewModel.dogListViewController = self
        self.dogListViewModel.loadData()
    }
    
    
    // MARK: - Helpers
    
    func configureUI(){
        self.title = "Dogs List"
        view.addSubview(self.dogsList)
    
        view.backgroundColor = .white
        // tableview anchors
        NSLayoutConstraint.activate([
            self.dogsList.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.dogsList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.dogsList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.dogsList.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}

    // MARK: - TableView Configuration
extension DogListController:UITableViewDelegate,UITableViewDataSource {
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dogListViewModel.allDogs.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cellInformation = self.dogListViewModel.allDogs[indexPath.row]
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: DogsTableViewCell.identifier, for: indexPath) as? DogsTableViewCell else {return UITableViewCell()}
    
    cell.setup(dog: cellInformation)
    
    return cell
}
    

    
}
