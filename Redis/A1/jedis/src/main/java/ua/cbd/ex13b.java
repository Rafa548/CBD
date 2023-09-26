package ua.cbd;

import redis.clients.jedis.Jedis;
import java.util.Map;

import java.util.HashMap;
import java.util.ArrayList;


public class ex13b { 
    public static String USERS_KEY = "users"; // Key set for users' name
    public static void main(String[] args) {
    Jedis jedis = new Jedis();
    String[] users = { "Ana", "Pedro", "Maria", "Luis" };
    ArrayList <String> usersl = new ArrayList<String>();
    ArrayList <String> userslh = new ArrayList<String>();
    Map<String, ArrayList<String>> usersh = new HashMap<String, ArrayList<String>>();

    for (String user : users) {
        usersl.add(user + "l");
        userslh.add(user + "lh");
    }

    usersh.put(USERS_KEY, userslh);

    for (String user : usersl){
        jedis.sadd(USERS_KEY,user);
    }

    for (String user : usersh.get(USERS_KEY)){
        jedis.sadd(USERS_KEY,user);
    }
    
    //jedis.del(USERS_KEY); //remove if exists to avoid wrong type
    /* for (String user : users)
        jedis.sadd(USERS_KEY,user); */

    jedis.smembers(USERS_KEY).forEach(System.out::println);

    jedis.close();

    }
}
