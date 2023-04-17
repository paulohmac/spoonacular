//
//  MainViewController.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 04/11/22.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    @IBOutlet weak var listBackgroundView: UIView!
    
    @IBOutlet weak var sugestionLabel: UILabel!
    
    private lazy var viewModel =  MainViewModel()

    private var randomRecipe :  Recipe?
    
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
        cancellable = viewModel.$randomRecipe
            .sink { recipe in
                self.randomRecipe = recipe
                self.populateRandomView()
            }

        cancellable =  viewModel.$error
            .sink { result in
                self.showError(erro: result)
            }
        loadData()
        
    }

    
    private func loadData(){
        viewModel.getRandomRecipe()
    }

    
    
    private func showError(erro : String){
        let alert = UIAlertController(title: "", message: "Message", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func populateRandomView(){
        sugestionLabel.text = randomRecipe?.title
    }
    
    
    /*
     // MARK: - Navigation
     */
    
    private func configView(){
        listBackgroundView.layer.cornerRadius = 10
    }
    
    
}

extension MainViewController: UITableViewDelegate{
    
    
}

extension MainViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

