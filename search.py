
from twython import Twython, TwythonError
import os
n = chr(34)
name_fichero     = "peru.xml" ## fichero resultado de busquedas 
fichero_palabras = "datos.txt"    ## fichero de entrada de palabras



#####1111111111 datos de la tabla "encabezado" 
ficheroA = open(name_fichero,"a") 
ficheroA.write("<?xml version="+n+"1.0"+n+" encoding="+n+"utf-8"+n+"?>\n" #version encoding
               +"<pma_xml_export version="+n+"1.0"+n+" xmlns:pma="+n+"http://www.phpmyadmin.net/some_doc_url/"+n+">\n" #pma_xml_export
               +"<pma:structure_schemas>\n"
               +"<pma:database name="+n+"bd1"+n+" collation="+n+"latin1_swedish_ci"+n+" charset="+n+"latin1"+n+">\n"#database name
               +"<pma:table name="+n+"user"+n+">\n"                       ###### table name ########### editar
                 
               +"CREATE TABLE `peru` ( `palabra` char(50) DEFAULT NULL,`cuenta` char(50) DEFAULT NULL,`fecha` char(50) DEFAULT NULL,`comentario` char(250) DEFAULT NULL)\n"   
               +"ENGINE=InnoDB DEFAULT CHARSET=latin1;\n"
              
               +"</pma:table>\n"
               +"</pma:database>\n"
               +"</pma:structure_schemas>\n"
               +"<database name="+n+"bd1"+n+">\n"                           ####database name####
              )
ficheroA.close()

##22222222222 llenado de tablas 
# peru (palabra(50),cuenta(50),fecha(50),comentario(250))
#===============================================
def busquedaPalabras(entrada,salida):
    fileInput=open(entrada,'r')
    fileOuput=open(salida,'a')
    lines = fileInput.read().splitlines()
    twitter = Twython('uUvA9IVS5DHCUXdPIWFcA','KD57gCGpmfSU23TWjcstwEipnm1J6YYYIHNuUJck','574051650-L0f9uZU2MNLTU3zY0N55rCAcE5JIQA5h4OPLfHGE','A6qjzoiQtA6wveQcqpnCCk7VOJ7CxjqlTt0yVaiivwI')
    counter = 0
    for line in lines:
        print line,counter
        PALABRA = line
        counter = counter+1
        try:
            search_results = twitter.search(q=line, count=200,include_rts=0)
        except TwythonError as e:
            print e
        for tweet in search_results['statuses']:
                  CUENTA    = tweet['user']['screen_name'].encode('utf-8')
                  FECHA      = tweet['created_at']
                  COMENTARIO = tweet['text'].encode('utf-8')
                  fileOuput.write("<table name="+n+"peru"+n+"><column name="+n+"palabra"+n+">"+PALABRA+"</column><column name="+n+"cuenta"+n+">"+CUENTA+"</column><column name="+n+"fecha"+n+">"+FECHA)
                  fileOuput.write("</column><column name="+n+"comentario"+n+">"+COMENTARIO+"</column></table>\n")
    fileOuput.write("</database>\n </pma_xml_export>\n")
    fileOuput.close()

busquedaPalabras(fichero_palabras, name_fichero)
