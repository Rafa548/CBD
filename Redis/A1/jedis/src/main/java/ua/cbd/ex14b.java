package ua.cbd;

import java.util.List;
import java.util.Scanner;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import java.io.FileReader;
import java.io.IOException;
import redis.clients.jedis.Jedis;

public class ex14b {

    public static void main(String[] args) throws CsvValidationException {

        Jedis jedis = new Jedis();
        String csvFilePath = "Redis/A1/nomes-pt-2021.csv"; 
        Scanner sc_in = new Scanner(System.in); 

        
        try (CSVReader reader = new CSVReader(new FileReader(csvFilePath))) {
                String[] line;
                while ((line = reader.readNext()) != null) {
                    String column1 = line[0];
                    String name = column1.split(";")[0];
                    Double numb = Double.parseDouble(column1.split(";")[1]);
                    jedis.zadd("autocomplete_b", numb, name);
                }
            
        } catch (IOException e) {
            e.printStackTrace();
        }


        System.out.print("Search for ('Enter' to quit): ");
        String search = sc_in.nextLine(); 
        while (!search.equals("")){
                List<String> sortedSetValues = jedis.zrevrange("autocomplete_b", 0, -1);  //zrevrange decrescente zrange crescente
                for (String name : sortedSetValues){
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

