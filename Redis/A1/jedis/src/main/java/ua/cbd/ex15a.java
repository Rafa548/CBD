package ua.cbd;

import java.util.Scanner;

import redis.clients.jedis.Jedis;

public class ex15a {
    public static void main(String[] args) {
        int time_limit = 1000;
        int n_unid = 30;

        Scanner sc_in = new Scanner(System.in); 
        Jedis jedis = new Jedis();

        System.out.print("Username: ");
        String username = sc_in.nextLine();

        long startTime = System.currentTimeMillis();
        if (jedis.get(username) == null){
            jedis.set(username+"time", String.valueOf(startTime));
            jedis.set(username, String.valueOf(n_unid));
        }

        while (!username.equals("")){
                System.out.print("Buying products ('Enter' to quit): ");
                String search = sc_in.nextLine(); 
                while (!search.equals("") ){
                        if (System.currentTimeMillis() - Long.parseLong(jedis.get(username+"time")) > time_limit*1000){
                            System.out.println("User quota reseted");
                            startTime = System.currentTimeMillis();
                            jedis.set(username+"time", String.valueOf(startTime));
                            jedis.set(username, String.valueOf(n_unid));
                        }
                        int n_unid_to_buy = Integer.parseInt(search);
                        int n_unid_avail = Integer.parseInt(jedis.get(username));
                        jedis.del(username);
                        if (n_unid_avail >= n_unid_to_buy){
                            jedis.set(username,String.valueOf(n_unid_avail-n_unid_to_buy));
                            System.out.println("You bought "+n_unid_to_buy+" units");
                        }
                        else if (n_unid_avail == 0){
                            jedis.set(username,String.valueOf(n_unid_avail));
                            System.out.println("No more units available");
                        }    
                        else {
                            jedis.set(username,String.valueOf(n_unid_avail));
                            System.out.println("Only "+n_unid_avail+" units available");
                        }
                        System.out.print("Buying products ('Enter' to quit): ");
                        search = sc_in.nextLine();
                }
            System.out.print("Username: ");
            username = sc_in.nextLine();
            if (!username.equals("")){
                if (Integer.parseInt(jedis.get(username)) == 0 && System.currentTimeMillis() - Long.parseLong(jedis.get(username+"time")) < time_limit*1000){
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
