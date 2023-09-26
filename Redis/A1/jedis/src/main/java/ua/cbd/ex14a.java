package ua.cbd;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;
import java.util.Scanner;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.params.SortingParams;

public class ex14a {
    public static void main(String[] args) {
        //read from file 
        Jedis jedis = new Jedis();

        File file = new File("Redis/A1/names.txt");
        Scanner sc_in = new Scanner(System.in); 

        try {
            Scanner myReader = new Scanner(file);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                jedis.sadd("autocomplete_a",data);

            }
        myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        SortingParams sortingParams = new SortingParams();
        sortingParams.alpha();

        System.out.print("Search for ('Enter' to quit): ");
        String search = sc_in.nextLine(); 
        while (!search.equals("")){
                List<String> autocompleted = jedis.sort("autocomplete_a", sortingParams);;
                for (String name : autocompleted){
                    if (name.startsWith(search)){
                        System.out.println(name);
                    }
                }
                System.out.print("Search for ('Enter' to quit): ");
                search = sc_in.nextLine();
        }
        jedis.close();
        sc_in.close();
    } 
}
