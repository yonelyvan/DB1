


// busqueda por id(por defecto)
DatastoreService db= DatastoreServiceFactory.getDatastoreService();	
		

   long id =Long.parseLong("6509108836433920");
	Key key=KeyFactory.createKey("usuario",id); 
		
    try{
    	Entity es = db.get(key);
    	System.out.println(es);  //imprime la entidad
    } catch(EntityNotFoundException es){
    	es.printStackTrace();
    }









        //-- entidad simple
		DatastoreService ds= DatastoreServiceFactory.getDatastoreService();
		
		Entity e =  new Entity("Person");
		e.setProperty("FirstName","mmmmmmmm");
		e.setProperty("LastName","alvarez");
	
	    //--- 
		ds.put(e);
		
		//creando entidad con entificador
		Entity user = new Entity("User",416);
		user.setProperty("user_id",415);
		user.setProperty("user_name","kevin");
		user.setProperty("user_password","password");
		user.setProperty("user_email","kevin@gmail.com");
		user.setProperty("user_age","25");
		
		ds.put(user);
		
		
		//entidades en  lote
		Entity e1 = new Entity("emp1"); 
		Entity e2 = new Entity("emp2");
		Entity e3 = new Entity("emp3");
		
	    List<Entity> en = Arrays.asList(e1,e2,e3);
	    ds.put(en);
