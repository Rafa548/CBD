import com.mongodb.MongoException;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import org.bson.Document;


public class Products {
   public static void main(String[] args) {
       int time_limit = 10;
       int n_unid = 30;
       String uri = "mongodb://localhost:27017";

       try (MongoClient mongoClient = MongoClients.create(uri)) {
            Scanner sc_in = new Scanner(System.in);
            MongoDatabase database = mongoClient.getDatabase("products");
            MongoCollection<Document> collection = database.getCollection("users");

            System.out.print("Username: ");
            String username = sc_in.nextLine();

            long n_unid_bought = 0;
            long startTime = System.currentTimeMillis();
            Document user = collection.find(new Document("username", username)).first();
            if (user == null) {
                startTime = System.currentTimeMillis();
                n_unid_bought = 0;
                collection.insertOne(new Document("username", username)
                        .append("time", startTime)
                        .append("units", n_unid_bought)
                        .append("products", new ArrayList<>()));
                user = collection.find(new Document("username", username)).first();           
            }
            else {
                n_unid_bought = user.getLong("units");
                startTime = user.getLong("time");
            }
            while (!username.equals("")) {
                System.out.printf("Buying products ('Enter' to quit) (%d/%d) : ", n_unid_bought, n_unid);
                String search = sc_in.nextLine();
                while (!search.equals("")) {
                    if (System.currentTimeMillis() - startTime > time_limit * 1000) {
                        System.out.println("User quota reseted");
                        startTime = System.currentTimeMillis();
                        n_unid_bought = 0;
                        collection.updateOne(new Document("username", username), new Document("$set", new Document("units", 0)));
                        //System.out.println(collection.find(new Document("username", username)).first());
                        collection.updateOne(new Document("username", username), new Document("$set", new Document("products", new ArrayList<>())));
                        //System.out.println(collection.find(new Document("username", username)).first());
                        user = collection.find(new Document("username", username)).first();
                    }                    
                    List<String> products = user.getList("products", String.class);
                    //System.out.println(products);
                    if (products == null) {
                        products = new ArrayList<>();
                    }
                    if (n_unid_bought < n_unid) {
                        products.add(search);
                        //System.out.println(products);
                        n_unid_bought = products.size();
                        //System.out.println("n_unid_bought: " + n_unid_bought);
                        //System.out.println("username: " + username);
                        collection.updateOne(new Document("username", username), new Document("$set", new Document("units", n_unid_bought)));
                        //System.out.println(collection.find(new Document("username", username)).first());
                        collection.updateOne(new Document("username", username), new Document("$set", new Document("products", products)));
                    } else {
                        System.out.println("No more units available");
                    }
                    System.out.printf("Buying products ('Enter' to quit) (%d/%d) : ", n_unid_bought, n_unid);
                    search = sc_in.nextLine();
                }
                System.out.print("Username: ");
                username = sc_in.nextLine();
                if (!username.equals("")) {
                    user = collection.find(new Document("username", username)).first();
                    if (user == null) {
                        startTime = System.currentTimeMillis();
                        n_unid_bought = 0;
                        collection.insertOne(new Document("username", username)
                                .append("time", startTime)
                                .append("units", n_unid_bought)
                                .append("products", new ArrayList<>()));
                        user = collection.find(new Document("username", username)).first();    
                    } 
                    else {
                        n_unid_bought = user.getLong("units");
                        startTime = user.getLong("time");
                        if (n_unid_bought == 30 && System.currentTimeMillis() - startTime < time_limit * 1000) {
                            System.out.println("Only 30 products every 20 seconds");
                        } 
                        else {
                            startTime = System.currentTimeMillis();
                            collection.updateOne(new Document("username", username), new Document("$set", new Document("units", n_unid_bought)));
                        }
                    }
                }
            }

            mongoClient.close();
            sc_in.close();
        }
        
   }
}

