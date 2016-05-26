/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author divinity
 */
public class IdCounter {
    private static long counter = 0;
 
    public static synchronized String nextId() {
        String a=String.format("%06d", ++counter);
        return a;         } 
    
}
