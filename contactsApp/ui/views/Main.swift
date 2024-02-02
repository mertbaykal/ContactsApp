//
//  ViewController.swift
//  contactsApp
//
//  Created by Mert Baykal on 16/10/2023.
//

import UIKit

class Main: UIViewController
{
    @IBOutlet weak var kisilerTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var kisilerListesi = [Kisiler]()
    
    var viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self

        self.title = "Contact"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton

        _ = viewModel.kisilerListesi.subscribe(onNext: { liste in
            self.kisilerListesi = liste
            self.kisilerTableView.reloadData()//arayuzu guncelle demek, degisiklik yaptim demek
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.kisileriYukle()
    }

    @objc func addButtonTapped() {
        performSegue(withIdentifier: "toSaveVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let selectedRow = kisilerTableView.indexPathForSelectedRow?.row {
                let kisi = kisilerListesi[selectedRow]
                if let gidilicekVC = segue.destination as? personDetialVC {
                    gidilicekVC.kisi = kisi
                }
            }
        }
    }
}

extension Main: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension Main: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! kisilerHucre
        hucre.kisilerLabel.text = kisi.personName
        hucre.kisiTelLable.text = kisi.personNuber
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)// geri dondugunde secilmis olancelli gostermez
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "sil") {contextualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "silme islemi", message: "\(kisi.personName!) silinsin mi?", preferredStyle: UIAlertController.Style.alert)
            
            let iptalAction = UIAlertAction(title: "iptal", style: UIAlertAction.Style.cancel)
            alert.addAction(iptalAction)
            
            let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.destructive){ action in
                
                self.viewModel.sil(id: kisi.personId!)
                
            }
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
