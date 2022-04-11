import Foundation


class DogListViewModel{
    
    var  dogListViewController:DogListController?
    
    public var allDogs = [Dog](){
        didSet{
            DispatchQueue.main.async {
                self.dogListViewController?.dogsList.reloadData()
            }
            
        }
    }
    
    public func loadData(){
        ListDogsServices.shared.getDogs { result in
            switch result {
            case .success(let dogs):
                self.allDogs = dogs
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
    
}
