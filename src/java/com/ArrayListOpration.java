/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.ArrayList;

/**
 *
 * @author divinity
 */
public class ArrayListOpration 
{
    public int getHighestIndexOfLists(ArrayList<ArrayList<String>> lists)
    {
        int hiIndex=0;
        for(int i=0;i<lists.size();i++)
        {
            if(lists.get(i).size()>hiIndex)
            {
                hiIndex=lists.get(i).size();
            }
        }
        return hiIndex;
    }
    
}
