package com.mahadev.configuration;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @author BAGHEL MIT
 */
@Aspect
@Component
public class LoggingAspect {
	private static final Logger log = LoggerFactory.getLogger(LoggingAspect.class);
	
	@Around("execution(* com.ict.hcg.ps.*.*.*(..)))  && @annotation(com.ict.hcg.ps.configuration.TrackExecutionTime")
	public Object aroundLog(ProceedingJoinPoint j) throws Throwable 
	{
		long startTime = System.currentTimeMillis();
		log.info("  " + j.getSignature().getDeclaringTypeName() + "  :  " + j.getSignature().getName() + " :     START ");
		Object value = j.proceed();
		long endtime = System.currentTimeMillis();
		log.info("  " + j.getSignature().getDeclaringTypeName() + "  :  " + j.getSignature().getName() + " :     END "+"  Time Execution is : " + (endtime-startTime) +"ms");
		return value;
	}
	
	@AfterThrowing(pointcut = "execution(* com.ict.hcg.ps.*.*.*(..))", throwing = "error")
	public void logAfterThrowing(JoinPoint j, Throwable error) 
	{
		log.error("  " + j.getSignature().getDeclaringTypeName() + "  :  " + j.getSignature().getName() + " :     Exception  : " + error.getMessage() + error);
	}
}
