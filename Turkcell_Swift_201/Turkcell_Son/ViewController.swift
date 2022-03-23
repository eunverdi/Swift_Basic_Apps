//
//  ViewController.swift
//  Turkcell_Son
//
//  Created by Ensar Batuhan Ünverdi on 23.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tvController: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var tumListe = [Makale]()
    var yuklenmisListe = [Makale]()
    var tumFiltreliListe = [Makale]()

    var sayfa = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        var m : Makale
        
        for i in 0...105 {
            m = Makale(baslikInıt: "Başlık\(i)", kisaAciklamaInıt: "Kısa Açıklama\(i)", aciklamaInıt: "Açıklama\(i)")
            tumListe.append(m)
            
            if i < 20 {
                yuklenmisListe.append(m)
            }
        }
        tumFiltreliListe.append(contentsOf: tumListe)
        
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TV_Cell", owner: self, options: nil)?.first as! TV_Cell
        cell.baslikLabel.text = yuklenmisListe[indexPath.row].baslik
        cell.aciklamaLabel.text = yuklenmisListe[indexPath.row].aciklama
        cell.aciklamaLabel.text = yuklenmisListe[indexPath.row].kisaAciklama
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yuklenmisListe.count

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height)) > (scrollView.contentSize.height * 0.9) {
            
            elemanEkle()
            
        }
    }
    
    func elemanEkle() {
        
        if (((sayfa + 1)*20) < tumFiltreliListe.count) {
            
            for i in ((sayfa + 1)*20)..<((sayfa + 2)*20) {
                
                if i < tumFiltreliListe.count {
                    
                    yuklenmisListe.append(tumFiltreliListe[i])
                }
            }
            
            sayfa += 1
            tvController.reloadData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sayfa = 0
        
        tumFiltreliListe = searchText.isEmpty ? tumListe : tumListe.filter({
            (makale : Makale) -> Bool in
           
            return makale.baslik.range(of: searchText, options: .caseInsensitive) != nil || makale.kisaAciklama.range(of: searchText, options: .caseInsensitive) != nil })
            
            yuklenmisListe.removeAll()
            
            for i in 0..<tumFiltreliListe.count{
                
                if i < 20 {
                    
                    yuklenmisListe.append(tumFiltreliListe[i])
                }
            }
            tvController.reloadData()
        }
    }


