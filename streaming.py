from twython import TwythonStreamer

CO = chr(34) #comilla '"'
name_data_base = "bd1"          # name of database
name_table = "china"             # name of table
atributes = ["palabra","cuenta","fecha","comentario"]      # atributes of table
ficheroTweets = "china.xml"
ficheroPalabras = "datos.txt" ### aun no funciona 
findWord = "china"
tweets = 3 #numero limite de tweets
#########################################
class Counter():
    counte = 3
    def _init_(self):
      self.counte=3
    def get(self):
      self.counte-=1
      return self.counte
    def Set(self,init_cont):
        self.counte=init_cont
cont = Counter()

File=open(ficheroTweets,'w')
archi_=open(ficheroPalabras,'r')

TABLE =("CREATE TABLE `"+name_table+"` ( `palabra` char(50) DEFAULT NULL,`cuenta` char(50) DEFAULT NULL,`fecha` char(50) DEFAULT NULL,`comentario` char(250) DEFAULT NULL)\n"
        +"ENGINE=InnoDB DEFAULT CHARSET=latin1;\n")

#-------------INSERT VARIABLES INTO TABLE---------------
def fillTable(File,name_table, atributes , variables):
    init_table = "<table name="+CO+name_table+CO+">\n";
    File.write(init_table)
    #plusCont()
    for i in range(0,len(atributes)):
        insert_variables = "<column name="+CO+atributes[i]+CO+">"+variables[i]+"</column>\n";
        File.write(insert_variables);
    exit_table = "</table>\n"
    File.write(exit_table)
#-------------------------------------------------------

init_xml = "<?xml version="+CO+"1.0"+CO+" encoding="+CO+"utf-8"+CO+"?>\n\n"
init_pma_xml_export = "<pma_xml_export version="+CO+"1.0"+CO+" xmlns:pma="+CO+"http://www.phpmyadmin.net/some_doc_url/"+CO+">\n\n"
init_pma_structure_schemas = "<pma:structure_schemas>\n"
init_pma_database = "<pma:database name="+CO+name_data_base+CO+" collation="+CO+"latin1_swedish_ci"+CO+" charset="+CO+"latin1"+CO+">\n" 
init_pma_table = "<pma:table name="+CO+name_table+CO+">\n"

#-------- insert table

exit_pma_table = "</pma:table>\n"
exit_pma_database = "</pma:database>\n"
exit_pma_structure_schemas = "</pma:structure_schemas>\n\n"
init_data_base = "<database name="+CO+name_data_base+CO+">\n\n"

#-------- insert values

exit_data_base = "</database>\n\n" 
exit_pma_xml_export = "</pma_xml_export>"
def tarea1():
    
    
    linea=archi_.readline()
    while linea!="":
          linea=archi_.readline()
    File.write(init_xml) #---------------------0
    File.write(init_pma_xml_export)#-----------1
    File.write(init_pma_structure_schemas)#----2
    File.write(init_pma_database)#-------------3
    File.write(init_pma_table)#----------------4
    File.write(TABLE)#-------------------------table
    File.write(exit_pma_table)#----------------4
    File.write(exit_pma_database)#-------------3
    File.write(exit_pma_structure_schemas)#----2
    File.write(init_data_base)#----------------add    

tarea1()
class MyStreamer(TwythonStreamer):
    def on_success(self, data):
        if 'user' in data:
             cuenta =    data['user']['screen_name'].encode('utf-8')
             print cuenta
             fecha =     data['created_at'].encode('utf-8')
             comentario =data['text'].encode('utf-8')
             n_user = [findWord,cuenta,fecha,comentario]
             fillTable(File,name_table,atributes,n_user)
             if(cont.get()<0):
                File.write("</database></pma_xml_export>")
                self.disconnect()

    def on_error(self, status_code, data):
        print status_code, data


stream = MyStreamer('uUvA9IVS5DHCUXdPIWFcA','KD57gCGpmfSU23TWjcstwEipnm1J6YYYIHNuUJck','574051650-L0f9uZU2MNLTU3zY0N55rCAcE5JIQA5h4OPLfHGE','A6qjzoiQtA6wveQcqpnCCk7VOJ7CxjqlTt0yVaiivwI')
n_Tweets=3;
cont.Set(n_Tweets-1)
stream.statuses.filter(track=findWord,include_rts=1)

print "finished----------------------"
File.close()
print "saving--"+ficheroTweets+"--------------------"

