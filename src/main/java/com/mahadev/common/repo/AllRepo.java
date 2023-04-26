package com.mahadev.common.repo;

import org.aspectj.apache.bcel.generic.RET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AllRepo {
   @Autowired LoginRepo loginRepo;
   
   public LoginRepo getLoginRepo() {
	 return loginRepo;
   }
   
}
