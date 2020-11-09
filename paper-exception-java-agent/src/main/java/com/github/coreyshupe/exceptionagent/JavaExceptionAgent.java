package com.github.coreyshupe.exceptionagent;

import java.lang.instrument.Instrumentation;

public class JavaExceptionAgent {
    public static void premain(String agentOps, Instrumentation inst) {
        implementExceptionHandler();
    }

    public static void agentmain(String agentOps, Instrumentation inst) {
        implementExceptionHandler();
    }

    private static void implementExceptionHandler() {
        System.out.println("Creating default uncaught exception handler.");
        Thread.setDefaultUncaughtExceptionHandler(((thread, throwable) -> {
            System.out.println("Caught error: " + throwable.getMessage());
        }));
    }
}
