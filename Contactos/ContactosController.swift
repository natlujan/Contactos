//
//  ContactosController.swift
//  Contactos
//
//  Created by Alumno on 20/10/22.
//  Copyright © 2022 ULSA. All rights reserved.
//

import UIKit

class ContactoController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tvContactos: UITableView!
    
    
    var contactos : [Contacto] = []
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as? CeldaContactoController
        celda?.lblNombre.text = contactos[indexPath.row].nombre
        celda?.lblNumero.text = contactos[indexPath.row].telefono

        return celda!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "goToAdd"{
            let destino = segue.destination as! AddController
            destino.callBackAgregarContacto = agregarContacto
        }
        if segue.identifier == "goToActualizar"{
            let destino = segue.destination as! ActualizarController
            destino.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            destino.callBackEditarContacto = editarContacto
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        contactos.append(Contacto(nombre: "contacto 1", telefono: "15352647"))
        contactos.append(Contacto(nombre: "contacto 2", telefono: "46334737"))
        contactos.append(Contacto(nombre: "contacto 3", telefono: "87697679"))
        
    }
    
    func agregarContacto(contacto: Contacto){
        contactos.append(contacto)
        tvContactos.reloadData()
    }
    
    func editarContacto(contacto: Contacto){
        tvContactos.reloadData()
    }
    
    
}
