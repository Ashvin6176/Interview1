package com.mahadev.configuration;


import javax.sql.DataSource;

import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariConfig;

@Configuration
@EnableTransactionManagement
public class DbConfig 
{
	@Bean
	public DataSource postgreDataSource()
	{
	    DataSourceBuilder<?> dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.url("jdbc:mysql://localhost:3306/mahadev");
        dataSourceBuilder.username("root");
        dataSourceBuilder.password("ashish");
        
        dataSourceBuilder.driverClassName("com.mysql.cj.jdbc.Driver");
        
        HikariConfig config = new HikariConfig();
        config.setMaximumPoolSize(3000);
        config.setConnectionTimeout(300000);
        config.setConnectionTimeout(120000);
        config.setLeakDetectionThreshold(300000);
        return dataSourceBuilder.build();
	}
}
