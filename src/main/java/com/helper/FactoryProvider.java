package com.helper;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		if (factory==null) {
			
			Configuration conf=new Configuration();
			conf.configure();
			factory=conf.buildSessionFactory();
			
			 
		}
		
		
		return factory;
		
	}
	
	public void closeFactory()
	{
		if (factory.isOpen()) {
			
			factory.close();
		}
	}
}
