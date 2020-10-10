package net.xupypr.myrentcar.controller;

public class ObjectValidationException extends RuntimeException {
    public ObjectValidationException(String message, Throwable cause) {
        super(message, cause);
    }

    public ObjectValidationException() {
    }

    public ObjectValidationException(String message) {
        super(message);
    }
}
