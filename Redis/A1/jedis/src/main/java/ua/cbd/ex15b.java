package ua.cbd;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import redis.clients.jedis.Jedis;

public class ex15b {
    public static void main(String[] args) {
        int time_limit = 20;
        int n_unid = 30;

        Scanner sc_in = new Scanner(System.in);
        Jedis jedis = new Jedis();

        List<String> products = new ArrayList<String>();
        products.add("orange");
        products.add("apple");
        products.add("banana");

        System.out.print("Username: ");
        String username = sc_in.nextLine();

        long startTime = System.currentTimeMillis();
        if (jedis.get(username) == null) {
            jedis.set(username + "time", String.valueOf(startTime));
            jedis.set(username, String.valueOf(n_unid));
        }

        while (!username.equals("")) {
            System.out.print("Buying products ('Enter' to quit): ");
            System.out.println(products);
            System.out.print("Product: ");
            String p_name = sc_in.nextLine();
            while (!p_name.equals("")) {
                System.out.print("Number of products: ");
                String n_pds = sc_in.nextLine();
                while (!n_pds.equals("")) {
                    if (System.currentTimeMillis() - Long.parseLong(jedis.get(username + "time")) > time_limit * 1000) {
                        System.out.println("User quota reseted");
                        startTime = System.currentTimeMillis();
                        jedis.set(username + "time", String.valueOf(startTime));
                        jedis.set(username, String.valueOf(n_unid));
                    }
                    int n_unid_to_buy = Integer.parseInt(n_pds);
                    int n_unid_avail = Integer.parseInt(jedis.get(username));
                    jedis.del(username);
                    if (n_unid_avail >= n_unid_to_buy) {
                        jedis.set(username, String.valueOf(n_unid_avail - n_unid_to_buy));
                        System.out.println("You bought " + n_unid_to_buy + " units");
                    } else if (n_unid_avail == 0) {
                        jedis.set(username, String.valueOf(n_unid_avail));
                        System.out.println("No more units available");
                    } else {
                        jedis.set(username, String.valueOf(n_unid_avail));
                        System.out.println("Only " + n_unid_avail + " units available");
                    }
                    System.out.print("Number of products: ");
                    n_pds = sc_in.nextLine();
                }
                System.out.print("Buying products ('Enter' to quit): ");
                System.out.println(products);
                System.out.print("Product: ");
                p_name = sc_in.nextLine();
            }
            System.out.print("Username: ");
            username = sc_in.nextLine();
            if (!username.equals("")) {
                if (jedis.get(username) == null){
                    startTime = System.currentTimeMillis();
                    jedis.set(username+"time", String.valueOf(startTime));
                    jedis.set(username, String.valueOf(n_unid));
                }
                else if (Integer.parseInt(jedis.get(username)) == 0 && System.currentTimeMillis()
                        - Long.parseLong(jedis.get(username + "time")) < time_limit * 1000) {
                    System.out.println("Only 30 products every 20 seconds");
                } else {
                    startTime = System.currentTimeMillis();
                    jedis.set(username + "time", String.valueOf(startTime));
                    jedis.set(username, String.valueOf(n_unid));
                }
            }
        }
        jedis.close();
        sc_in.close();
    }
}
