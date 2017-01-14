//
//  ViewController.swift
//  Swift300_Day1_1_EstruturaDeDiretorios
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     
     Sandbox
     
     O sistema de arquivos em iOS é convencionado de forma que aplicativos tenham execuções independentes, para manter este sistema simples, o usuário do dispositivo não tem acesso direto a esse sistema de arquivos.
     
     Interações de um App iOS com o sistema de arquivos são limitadas principalmente para os diretórios dentro do aplicativo. Durante a instalação de um novo aplicativo o instalador cria uma série de recipientes (containers) para o mesmo. Cada container tem uma função específica.
     
     Bundle Container - Recursos iniciais
     
     Cloud Container - Recursos do iCloud
     
     Data Container
     
            - tmp: Recursos temporários
     
            - Library: Recursos da aplicação
     
            - Documents: Recursos de compartilhamento com o usuário
     
     
     */
    
    // ========================
    
    // Antes de acessar qualquer diretório, é necessário conhecer a localização. O primeiro passo é acessar a pasta raiz da aplicação e a partir dela podemos acessar suas subpastas.
    
    // Acessando a pasta raiz
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let caminhoParaSandBox = NSHomeDirectory()
        
        print("\n\n\n\n\n[Caminho: \(caminhoParaSandBox)]\n\n\n\n\n\n")
        
        /*
         
         cmd + shift + G -> Para acessar uma parta através do caminho
         
         Criando o caminho até o diretório Documents
         
         */
        
        let caminhoParaAPastaDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
        
        print("\n\nDocuments: \(caminhoParaAPastaDocuments)\n\n")
        
        /*
         
         Além de usar a estrutura padronizada, você precisará em diversas situações, remover, renomear, criar ou efetuar outras ações em arquivos ou diretórios
         
         O objeto responsável por as interações é o FileManager. Ele permite examinar o conteúdo de um elementodo sistema e realizar as respectivas alterações
         
         Obs.: Control + I = auto identação, cmd + / -> auto coment
         
         */
        
        // Criando um objeto de FileManager
        
        let gerenciadorDeArquivos = FileManager.default
        
        // =================== Criando subdiretórios dentro do diretório Documents ============================
        
        let home = NSHomeDirectory()
        let pathDocuments = (home as NSString).appendingPathComponent("Documents")
        let pathSubdiretorio = (pathDocuments as NSString).appendingPathComponent("Subdiretorio")
        
        print("\n\n\nSubdiretorio: \(pathSubdiretorio)\n\n\n")
        
        do{
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio, withIntermediateDirectories: false, attributes: nil)
        
        } catch{}
        
        // ====================== Verificando a existência de um arquivo ======================================
        
        if gerenciadorDeArquivos.fileExists(atPath: pathSubdiretorio){
            
            print("\n\n\nArquivo Existe\n\n\n")
            
        }else{
            
            print("Arquivo não existe")
            
        }
        
        // ===================== Apagando arquivos ou diretórios ==============================================
        
        do{
            
            try gerenciadorDeArquivos.removeItem(atPath: pathSubdiretorio)
            
        }catch{}
        
        
        // ===================== Movendo arquivos ou diretórios ===============================================
        
        
            // Criando dois novos diretórios
        let pathSubdiretorio2 = (pathDocuments as NSString).appendingPathComponent("Subdiretorio2")
        
        do{
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio2, withIntermediateDirectories: false, attributes: nil)
            
        }catch{}
        
        let pathSubdiretorio3 = (pathDocuments as NSString).appendingPathComponent("Subdiretorio3")
        
        do{
            
            try gerenciadorDeArquivos.createDirectory(atPath: pathSubdiretorio3, withIntermediateDirectories: false, attributes: nil)
            
        }catch{}
        
            // Movendo os diretórios
        
        do{
            
            try gerenciadorDeArquivos.moveItem(atPath: pathSubdiretorio3, toPath: (pathSubdiretorio2 as NSString).appendingPathComponent("Subdiretorio3"))
            
        }catch{}
        
        // ============================ Copiando arquivos ou diretórios ============================================
        
        let pathSubdiretorioParaSerCopiado = (pathDocuments as NSString).appendingPathComponent("SubdiretorioParaSerCopiado")
        
        do{
            
            try gerenciadorDeArquivos.copyItem(atPath: pathSubdiretorioParaSerCopiado, toPath: (pathDocuments as NSString).appendingPathComponent("SubdiretorioQueFoiCopiado"))
            
        }catch{}
        
    }
    
    
   
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

