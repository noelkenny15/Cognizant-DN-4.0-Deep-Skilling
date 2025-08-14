package com.library.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

public class LoggingAspect {
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("LoggingAspect: Before method - " + joinPoint.getSignature());
        long start = System.currentTimeMillis();

        Object result = joinPoint.proceed();

        long timeTaken = System.currentTimeMillis() - start;
        System.out.println("LoggingAspect: After method - " + joinPoint.getSignature());
        System.out.println("Execution time: " + timeTaken + " ms");
        return result;
    }
}
