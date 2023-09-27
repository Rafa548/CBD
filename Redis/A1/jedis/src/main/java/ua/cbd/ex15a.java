package ua.cbd;

import java.util.Scanner;

import redis.clients.jedis.Jedis;

public class ex15a {
    public static void main(String[] args) {
        int time_limit = 10;
        int n_unid = 30;

        Scanner sc_in = new Scanner(System.in); 
        Jedis jedis = new Jedis();

        System.out.print("Username: ");
        String username = sc_in.nextLine();

        long n_unid_bought = 0;
        long startTime = System.currentTimeMillis();
        if (jedis.get(username) == null){
            jedis.set(username+"time", String.valueOf(startTime));
            jedis.set(username, String.valueOf(n_unid));

        }

        while (!username.equals("")){
                System.out.printf("Buying products ('Enter' to quit) (%d/%d) : ",n_unid_bought,Integer.parseInt(jedis.get(username)));
                String search = sc_in.nextLine();
                while (!search.equals("") ){
                        if (System.currentTimeMillis() - Long.parseLong(jedis.get(username+"time")) > time_limit*1000){
                            System.out.println("User quota reseted");
                            startTime = System.currentTimeMillis();
                            jedis.set(username+"time", String.valueOf(startTime));
                            jedis.set(username, String.valueOf(n_unid));
                            jedis.del(username+"p");
                        }
                        n_unid_bought = jedis.scard(username+"p");
                        if (n_unid_bought < Integer.parseInt(jedis.get(username))){
                            jedis.sadd(username+"p", search);
                        }
                        else
                            System.out.println("No more units available");

                        n_unid_bought = jedis.scard(username+"p");
                        int n_unid_avail = Integer.parseInt(jedis.get(username));
                        System.out.printf("Buying products ('Enter' to quit) (%d/%d) : ",n_unid_bought,n_unid_avail);
                        search = sc_in.nextLine();
                }
            System.out.print("Username: ");
            username = sc_in.nextLine();
            if (!username.equals("")){
                if (jedis.get(username) == null){
                    startTime = System.currentTimeMillis();
                    jedis.set(username+"time", String.valueOf(startTime));
                    jedis.set(username, String.valueOf(n_unid));
                    n_unid_bought = 0;
                }
                else if (Integer.parseInt(jedis.get(username)) == 0 && System.currentTimeMillis() - Long.parseLong(jedis.get(username+"time")) < time_limit*1000){
                    System.out.println("Only 30 products every 20 seconds");
                }
                else{
                    startTime = System.currentTimeMillis();
                    jedis.set(username+"time", String.valueOf(startTime));
                    jedis.set(username, String.valueOf(n_unid));
                } 
            }
        }
        jedis.close();
        sc_in.close();
    }
}
